#
# Copyright Peter Donald
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

provides :glassfish_domain, os: 'windows'

include Chef::Asadmin

def default_logging_properties
  {
    'handlers' => 'java.util.logging.ConsoleHandler',
    'handlerServices' => 'com.sun.enterprise.server.logging.GFFileHandler,com.sun.enterprise.server.logging.SyslogHandler',

    'java.util.logging.ConsoleHandler.formatter' => 'com.sun.enterprise.server.logging.UniformLogFormatter',

    'com.sun.enterprise.server.logging.GFFileHandler.formatter' => 'com.sun.enterprise.server.logging.UniformLogFormatter',
    'com.sun.enterprise.server.logging.GFFileHandler.file' => '${com.sun.aas.instanceRoot}/logs/server.log',
    'com.sun.enterprise.server.logging.GFFileHandler.rotationTimelimitInMinutes' => '0',
    'com.sun.enterprise.server.logging.GFFileHandler.flushFrequency' => '1',
    'com.sun.enterprise.server.logging.GFFileHandler.logtoConsole' => 'false',
    'com.sun.enterprise.server.logging.GFFileHandler.rotationLimitInBytes' => '2000000',
    'com.sun.enterprise.server.logging.GFFileHandler.retainErrorsStasticsForHours' => '0',
    'com.sun.enterprise.server.logging.GFFileHandler.maxHistoryFiles' => '3',
    'com.sun.enterprise.server.logging.GFFileHandler.rotationOnDateChange' => 'false',

    'com.sun.enterprise.server.logging.SyslogHandler.useSystemLogging' => 'false',

    'log4j.logger.org.hibernate.validator.util.Version' => 'warn',

    # Payara 5.182
    'fish.payara.enterprise.server.logging.PayaraNotificationFileHandler.compressOnRotation' => 'false',
    'fish.payara.enterprise.server.logging.PayaraNotificationFileHandler.rotationLimitInBytes' => '2000000',
    'fish.payara.enterprise.server.logging.PayaraNotificationFileHandler.rotationOnDateChange' => 'false',
    'fish.payara.enterprise.server.logging.PayaraNotificationFileHandler.file' => '${com.sun.aas.instanceRoot}/logs/notification.log',
    'fish.payara.enterprise.server.logging.PayaraNotificationFileHandler.logtoFile' => 'true',
    'fish.payara.enterprise.server.logging.PayaraNotificationFileHandler.maxHistoryFiles' => '0',
    'com.sun.enterprise.server.logging.GFFileHandler.logtoFile' => 'true',
    'fish.payara.enterprise.server.logging.PayaraNotificationFileHandler.rotationTimelimitInMinutes' => '0',

    # All log level details
    '.level' => 'INFO',

    'com.sun.enterprise.server.logging.GFFileHandler.level' => 'ALL',
    'javax.enterprise.system.tools.admin.level' => 'INFO',
    'org.apache.jasper.level' => 'INFO',
    'javax.enterprise.resource.corba.level' => 'INFO',
    'javax.enterprise.system.core.level' => 'INFO',
    'javax.enterprise.system.core.classloading.level' => 'INFO',
    'java.util.logging.ConsoleHandler.level' => 'FINEST',
    'javax.enterprise.system.webservices.saaj.level' => 'INFO',
    'javax.enterprise.system.tools.deployment.level' => 'INFO',
    'javax.enterprise.system.container.ejb.level' => 'INFO',
    'javax.enterprise.system.core.transaction.level' => 'INFO',
    'org.apache.catalina.level' => 'INFO',
    'javax.enterprise.system.container.ejb.mdb.level' => 'INFO',
    'org.apache.coyote.level' => 'INFO',
    'javax.level' => 'INFO',
    'javax.enterprise.resource.javamail.level' => 'INFO',
    'javax.enterprise.system.webservices.rpc.level' => 'INFO',
    'javax.enterprise.system.container.web.level' => 'INFO',
    'javax.enterprise.system.util.level' => 'INFO',
    'javax.enterprise.resource.resourceadapter.level' => 'INFO',
    'javax.enterprise.resource.jms.level' => 'INFO',
    'javax.enterprise.system.core.config.level' => 'INFO',
    'javax.enterprise.system.level' => 'INFO',
    'javax.enterprise.system.core.security.level' => 'INFO',
    'javax.enterprise.system.container.cmp.level' => 'INFO',
    'javax.enterprise.system.webservices.registry.level' => 'INFO',
    'javax.enterprise.system.core.selfmanagement.level' => 'INFO',
    'javax.enterprise.resource.jdo.level' => 'INFO',
    'javax.enterprise.system.core.naming.level' => 'INFO',
    'javax.enterprise.resource.webcontainer.jsf.application.level' => 'INFO',
    'javax.enterprise.resource.webcontainer.jsf.resource.level' => 'INFO',
    'javax.enterprise.resource.webcontainer.jsf.config.level' => 'INFO',
    'javax.enterprise.resource.webcontainer.jsf.context.level' => 'INFO',
    'javax.enterprise.resource.webcontainer.jsf.facelets.level' => 'INFO',
    'javax.enterprise.resource.webcontainer.jsf.lifecycle.level' => 'INFO',
    'javax.enterprise.resource.webcontainer.jsf.managedbean.level' => 'INFO',
    'javax.enterprise.resource.webcontainer.jsf.renderkit.level' => 'INFO',
    'javax.enterprise.resource.webcontainer.jsf.taglib.level' => 'INFO',
    'javax.enterprise.resource.webcontainer.jsf.timing.level' => 'INFO',
    'javax.enterprise.resource.jta.level' => 'WARNING',
    'javax.enterprise.resource.sqltrace.level' => 'FINE',
    'javax.org.glassfish.persistence.level' => 'INFO',
    'org.jvnet.hk2.osgiadapter.level' => 'INFO',
    'javax.enterprise.system.tools.backup.level' => 'INFO',
    'org.glassfish.admingui.level' => 'INFO',
    'javax.enterprise.system.ssl.security.level' => 'INFO',
    'ShoalLogger.level' => 'CONFIG',
    'org.eclipse.persistence.session.level' => 'INFO',
    'javax.enterprise.resource.resourceadapter.com.sun.gjc.spi.level' => 'WARNING',
    'com.hazelcast.level' => 'WARNING',
  }
end

def default_realm_confs
  common_confs = {
    'fileRealm' => 'com.sun.enterprise.security.auth.login.FileLoginModule',
    'ldapRealm' => 'com.sun.enterprise.security.auth.login.LDAPLoginModule',
    'solarisRealm' => 'com.sun.enterprise.security.auth.login.SolarisLoginModule',
  }

  if node['glassfish']['version'][0] == '4'
    {
      'jdbcRealm' => 'com.sun.enterprise.security.ee.auth.login.JDBCLoginModule',
      'jdbcDigestRealm' => 'com.sun.enterprise.security.ee.auth.login.JDBCDigestLoginModule',
      'pamRealm' => 'com.sun.enterprise.security.ee.auth.login.PamLoginModule',
    }.merge common_confs
  else
    {
      'jdbcRealm' => 'com.sun.enterprise.security.auth.login.JDBCLoginModule',
      'jdbcDigestRealm' => 'com.sun.enterprise.security.auth.login.JDBCDigestLoginModule',
      'pamRealm' => 'com.sun.enterprise.security.auth.login.PamLoginModule',
    }.merge common_confs
  end
end

def domain_dir_arg
  "--domaindir #{node['glassfish']['domains_dir']}"
end

def service_name
  "glassfish-#{new_resource.domain_name}"
end

def jdk_path
  ::File.join(node['java']['java_home'], 'bin', 'java.exe')
end

action :create do
  if new_resource.system_group != node['glassfish']['group']
    group new_resource.system_group do
      action :create
      append true
    end
  end

  if new_resource.system_user != node['glassfish']['user']
    user new_resource.system_user do
      comment "GlassFish #{new_resource.domain_name} Domain"
      gid new_resource.system_group
      home "#{node['glassfish']['domains_dir']}/#{new_resource.domain_name}"
      system true
    end
  end

  directory node['glassfish']['domains_dir'] do
    owner node['glassfish']['user']
    group node['glassfish']['group']
    mode '0755'
    recursive true
  end

  master_password = new_resource.master_password || new_resource.password

  if master_password.nil? || master_password.length <= 6
    raise 'The master_password parameter is unspecified and defaulting to the domain password. The user must specify a master_password greater than 6 characters or increase the size of the domain password to be greater than 6 characters.' if new_resource.master_password.nil?
    raise 'The master_password parameter must be greater than 6 characters.'
  end

  template new_resource.password_file do # ~FC021
    cookbook 'glassfish'
    source 'password.erb'
    owner new_resource.system_user
    group new_resource.system_group unless node.windows?
    mode '0600'
    variables password: new_resource.password,
              master_password: master_password

    not_if { new_resource.password.nil? }
    not_if { new_resource.password_file.nil? }
  end

  cookbook_file "#{new_resource.domain_dir_path}/config/default-web.xml" do
    source "default-web-#{node['glassfish']['version']}.xml"
    cookbook 'glassfish'
    owner node['glassfish']['user']
    group node['glassfish']['group']
    mode '0644'
    action :nothing
  end

  file "#{new_resource.domain_dir_path}/docroot/index.html" do
    action :nothing
  end

  execute "create domain #{new_resource.domain_name}" do
    not_if "#{asadmin_command('list-domains')} #{domain_dir_arg} | findstr /R /B /C:\"#{new_resource.domain_name}\"", timeout: node['glassfish']['asadmin']['timeout'] + 5

    create_args = []
    create_args << '--checkports=false'
    create_args << '--savemasterpassword=true'
    create_args << "--portbase #{new_resource.portbase}" if new_resource.portbase
    create_args << "--instanceport #{new_resource.port}" unless new_resource.portbase
    create_args << "--adminport #{new_resource.admin_port}" unless new_resource.portbase
    create_args << '--nopassword=false' if new_resource.username
    create_args << "--keytooloptions CN=#{new_resource.certificate_cn}" if new_resource.certificate_cn
    create_args << domain_dir_arg

    # execute should wait for asadmin to time out first, if it doesn't because of some problem, execute should time out eventually
    timeout node['glassfish']['asadmin']['timeout'] + 5

    command asadmin_command("create-domain #{create_args.join(' ')} #{new_resource.domain_name}", false)

    notifies :create, "cookbook_file[#{new_resource.domain_dir_path}/config/default-web.xml]", :immediate if node['glassfish']['variant'] != 'payara'
    notifies :delete, "file[#{new_resource.domain_dir_path}/docroot/index.html]", :immediate
  end

  glassfish_wait_for_glassfish new_resource.domain_name do
    secure new_resource.secure
    username new_resource.username
    password new_resource.password
    admin_port new_resource.admin_port
    only_if { new_resource.admin_port }
    action :nothing
  end

  # There is a bug in the Glassfish 4 domain creation that puts the master-password in the wrong spot. This copies it back.
  ruby_block 'copy master-password' do
    source_file = "#{new_resource.domain_dir_path}/config/master-password"
    dest_file = "#{new_resource.domain_dir_path}/master-password"

    only_if { node['glassfish']['version'][0] == '4' }
    only_if { ::File.exist?(source_file) }
    not_if { ::File.exist?(dest_file) }

    block do
      FileUtils.cp(source_file, dest_file)
      FileUtils.chown(new_resource.system_user, new_resource.system_group, dest_file)
    end
  end

  template "#{new_resource.domain_dir_path}/config/logging.properties" do
    source 'logging.properties.erb'
    mode '0600'
    cookbook 'glassfish'
    owner new_resource.system_user
    variables(logging_properties: default_logging_properties.merge(new_resource.logging_properties))
    notifies :restart, "windows_service[#{service_name}]", :delayed
  end

  template "#{new_resource.domain_dir_path}/config/login.conf" do
    source 'login.conf.erb'
    mode '0600'
    cookbook 'glassfish'
    owner new_resource.system_user
    group new_resource.system_group unless node.windows?
    variables realm_types: default_realm_confs.merge(new_resource.realm_types)
    notifies :restart, "windows_service[#{service_name}]", :delayed
  end

  # Directory required for Payara 4.1.151
  directory "#{new_resource.domain_dir_path}/bin" do
    owner new_resource.system_user
    group new_resource.system_group unless node.windows?
    mode '0755'
  end

  # Directory required for Payara 4.1.152
  %w(lib lib/ext).each do |dir|
    directory "#{new_resource.domain_dir_path}/#{dir}" do
      owner new_resource.system_user
      group new_resource.system_group unless node.windows?
      mode '0755'
    end
  end

  file "#{new_resource.domain_dir_path}/bin/#{new_resource.domain_name}_asadmin.bat" do
    mode '0700'
    owner new_resource.system_user
    group new_resource.system_group unless node.windows?
    content <<-BAT
#{Asadmin.asadmin_command(node, '%*', remote_command: true, terse: false, echo: new_resource.echo, username: new_resource.username, password_file: new_resource.password_file, secure: new_resource.secure, admin_port: new_resource.admin_port)}
    BAT
  end

  require 'win32/service'

  execute "create_service_#{service_name}" do
    create_args = []
    create_args << "--name=#{service_name}"
    create_args << domain_dir_arg

    # execute should wait for asadmin to time out first, if it doesn't because of some problem, execute should time out eventually
    timeout node['glassfish']['asadmin']['timeout'] + 5

    command asadmin_command("create-service #{create_args.join(' ')} #{new_resource.domain_name}", false)
    # notifies :start, "windows_service[#{service_name}]", :immediately
    not_if { Win32::Service.exists?(service_name) }
  end

  windows_service service_name do
    timeout 180
    action :nothing
    notifies :run, "glassfish_wait_for_glassfish[#{new_resource.domain_name}]", :immediately
  end
end

action :restart do
  windows_service service_name do
    timeout 180
    action [:restart]
    notifies :run, "glassfish_wait_for_glassfish[#{new_resource.domain_name}]", :immediately
  end
end

action :destroy do
  windows_service service_name do
    action [:stop, :disable, :delete]
    ignore_failure true
  end

  directory new_resource.domain_dir_path do
    recursive true
    action :delete
  end
end
