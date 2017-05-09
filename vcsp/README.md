# Tools for Veeam Cloud Service Providers 

Various tools and files to make working with Veeam a little easier.


## Requirements

- Ruby
  - gem: Nokogiri
  - gem: Unirest

## Howto

Edit config.rb and insert your Enterprise Manager hostname, port, username and password


## Sample output

```
Name           Description                     Quota   Used  VMs Enab  Last    Last active
cb2971128970   Partner #3  --  End Cust #1234   2048   1309    4 true  Success 2017-05-08T19:14:33.57Z
cb2971144347   Partner #3  --  End Cust #1234  12800   6153   36 true  Success 2017-05-09T09:20:09.73Z
cb2971117585   Partner #3  --  End Cust #1234   8192   4861    4 true  Success 2017-05-08T23:57:23.39Z
cb2971124866   Partner #9  --  End Cust #1234   8192   1989   14 true  Success 2017-05-09T03:29:33.027Z
cb2971102969   Partner #10 --  End Cust #1234   2048    804    6 true  Success 2017-05-09T01:18:16.68Z
cb2971148452   Partner #1  --  End Cust #1234   8960   3953   35 true  Success 2017-05-09T01:39:07.933Z
cb2971106427   Partner #2  --  End Cust #1234   4096   2215   12 false Success 2017-03-22T02:53:19.46Z
cb2971156807   Partner #3  --  End Cust #1234   1024    314    3 true  Success 2017-05-09T00:11:56.36Z
cb2971128703   Partner #3  --  End Cust #1234   3072   1533    3 true  Success 2017-05-09T02:08:25.937Z
cb2971126196   Partner #6  --  End Cust #1234   4096   2168    4 true  Success 2017-05-08T23:51:11.717Z
```
