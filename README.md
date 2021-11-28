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

## TODO
1. validate row data with validate function or Validator
2. support more types of more than just weblog row
3. parse arguments with more options like -u --unique
4. more helpful return messages


