# Development
## Docker
```
docker build -t rubyapp .
docker run -v /home/app:/opt/app -ti --rm rubyapp sh
```

## Lint
```
rubocop --auto-gen-config
```
## Test
```
bundle install
COVERAGE=true rspec spec
```

