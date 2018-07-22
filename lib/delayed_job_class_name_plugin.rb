require 'active_support'
require 'active_record'
require 'delayed_job'
require 'delayed_job_active_record'
require 'delayed/class_name'

Delayed::Worker.plugins << Delayed::ClassName::Plugin
