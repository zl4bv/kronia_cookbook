name            'kronia'
default_source  :supermarket
run_list        ['kronia']
cookbook        'kronia', path: File.expand_path('..', __FILE__)
