# Development
## Docker
```
docker build -t rubyapp .
docker run -v /home/app:/opt/app -ti --rm rubyapp sh
```

## Test
```
bundle install
rspec spec
```

