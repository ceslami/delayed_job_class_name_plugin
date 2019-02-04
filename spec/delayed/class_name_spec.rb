require 'spec_helper'

describe Delayed::ClassName do
  let(:job) { Delayed::Job.all.first }

  context 'when there is not a custom parser' do
    before do
      Delayed::ClassName.configure do |c|
        c.custom_parser = nil
      end
    end

    context 'when your job has a display_name method' do
      it 'assigns the display name of the payload object to class_name' do
        Delayed::Job.enqueue TestJobWithDisplayName.new
        expect(job.class_name).to eq 'TestDisplayName'
      end
    end

    context 'when your job does not have a display name method' do
      it 'assigns the class name of the payload object to class_name' do
        Delayed::Job.enqueue TestJob.new
        expect(job.class_name).to eq 'TestJob'
      end
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
