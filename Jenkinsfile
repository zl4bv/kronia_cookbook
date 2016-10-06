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

if (isRelease()) {

    stage "Publish"

    echo "Would publish to Chef Supermarket" // TODO
    slackSend "Published ${name()} cookbook version ${version()} to the Supermarket", color: 'good'

}

def chef_exec(command) {
    sh "chef exec ${command}"
}

def isRelease() {
    false // FIXME: Building git tags is not yet supported (JENKINS-34395)
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
