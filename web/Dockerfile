FROM centos:6
MAINTAINER "Pehr Johansson" <pehr.l.johansson@gmail.com>
RUN yum -y install https://packages.chef.io/stable/el/6/chef-12.9.38-1.el6.x86_64.rpm git which
RUN yum -y groupinstall 'Development Tools'
RUN /opt/chef/embedded/bin/gem install berkshelf --no-ri --no-rdoc
COPY ./web/Berksfile /Berksfile
COPY ./web/solo.rb /var/chef/solo.rb
COPY ./web/solo.json /var/chef/solo.json
# Download cookbooks to use
RUN cd / && /opt/chef/embedded/bin/berks vendor /var/chef/cookbooks
# Perform a chef run
RUN chef-solo -c /var/chef/solo.rb -j /var/chef/solo.json 
# Stop nginx so we can run it in foreground later
RUN service nginx stop
# Setup default site as RR with app1 and app2
COPY ./web/default /etc/nginx/sites-available/default
CMD nginx -g 'daemon off;'
