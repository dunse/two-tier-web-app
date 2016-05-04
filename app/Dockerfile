FROM centos:6
MAINTAINER "Pehr Johansson" <pehr.l.johansson@gmail.com>
RUN yum -y install https://packages.chef.io/stable/el/6/chef-12.9.38-1.el6.x86_64.rpm git which
RUN yum -y groupinstall 'Development Tools'
RUN /opt/chef/embedded/bin/gem install berkshelf --no-ri --no-rdoc
COPY ./app/Berksfile /Berksfile
COPY ./app/solo.rb /var/chef/solo.rb
COPY ./app/solo.json /var/chef/solo.json
COPY ./app/sample.go /var/run/sample.go
# Download cookbooks to use
RUN cd / && /opt/chef/embedded/bin/berks vendor /var/chef/cookbooks
# Perform a chef run
RUN chef-solo -c /var/chef/solo.rb -j /var/chef/solo.json 
# Default command to run
CMD /usr/local/go/bin/go run /var/run/sample.go
