import groovy.json.JsonOutput

stage "Checkout"

node {
    checkout scm
}

stage "Style checks"

parallel(Rubocop: {
    node {
        chef_exec "rubocop"
    }
}, Foodcritic: {
    node {
        chef_exec "foodcritic ."
    }
})

stage "Unit tests"

node {
    chef_exec 'rspec'
}

stage "Integration tests"

node {
    chef_exec "kitchen test"
}

def chef_exec(command) {
    sh "chef exec ${command}"
}

stage "Publish"

if (version() != version_in_supermarket()) {
    echo "Would publish to Chef Supermarket"
}

def name() {
    node {
        def matcher = readFile('metadata.rb') =~ "name +'(.+)'"
        matcher ? matcher[0][1] : null
    }
}

def version() {
    node {
        def matcher = readFile('metadata.rb') =~ "version +'(.+)'"
        matcher ? matcher[0][1] : null
    }
}

def version_in_supermarket() {
    def response = httpRequest("https://supermarket.chef.io/api/v1/cookbooks/${name()}")
    node {
        def jsonSlurper = new JsonSlurper()
        def cookbook_meta = jsonSlurper.parseText(response.content)
        def version_response = httpRequest(cookbook_metadata.latest_version)
        def version_meta = jsonSlurper.parseText(version_response.content)
        version_meta.version
    }
}
