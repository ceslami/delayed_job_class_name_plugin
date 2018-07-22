require 'spec_helper'

describe Delayed::ClassName do
  let(:job) { Delayed::Job.all.first }

  context 'when there is not a custom parser' do
    before do
      Delayed::ClassName.configure do |c|
        c.custom_parser = nil
      end
    end

    it 'assigns the class name of the payload object to class_name' do
      Delayed::Job.enqueue TestJob.new
      expect(job.class_name).to eq 'TestJob'
    end
  end

  context 'when there is a custom parser' do
    before do
      Delayed::ClassName.configure do |c|
        c.custom_parser = ->(job) {
          job.class.name + '1'
        }
      end
    end

    it 'assigns the parsed value to class_name' do
      Delayed::Job.enqueue TestJob.new
      expect(job.class_name).to eq 'TestJob1'
    end
  end
end
