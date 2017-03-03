## SETUP
- Update Gemfile with URL with user/pass for sidekiq-ent and run bundle install. Alternatively, export the SIDEKIQ_ENT_SOURCE variable:

```
export SIDEKIQ_ENT_SOURCE="__your sidekiq URL with your credentials__"; bundle install
```


## How to run
- Run Redis
- Run sidekiq:

```
bundle exec sidekiq -r ./sidekiq.rb
```

- Check sidekiq logs. On the first execution, you should see the output:
```
secret bag: {"ssn"=>"123-45-6789"}
```
Job will fail and retry in a few seconds. On the next execution, you will see an encrypted value for secret_bag.
```
secret bag: BAhTOhFTaWRla2lxOjpFbmMKOgZjSSIQYWVzLTI1Ni1nY20GOgZFVDoIdGFnIhWtJ33R20W8hT4d1iMv8csrOgdpdiIRbAavi9Jkadxt2iKROgZ2aQY6CWJsb2IiJufY9ZpMxklPYMI632TXXhRH1MgFEMsxP8Qluuu3-oA8SQ==
```
