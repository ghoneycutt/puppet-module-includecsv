require 'spec_helper'

describe 'includecsv' do
  context 'with an invalid type for the argument' do
		it { is_expected.to run.with_params(['wrong','type']).and_raise_error(Puppet::ParseError) }
  end

  context 'with the incorrect number of arguments (not 1)' do
		it { is_expected.to run.with_params('too','many').and_raise_error(Puppet::ParseError) }
  end

  context "with the string 'dnsclient,::inittab,stdlib'" do
    before { subject.call(['dnsclient,::inittab,stdlib']) }

		# this lambda is required due to strangeness within rspec-puppet's expectation handling
    it { expect(lambda { catalogue }).to contain_class('dnsclient') }
    it { expect(lambda { catalogue }).to contain_class('inittab') }
    it { expect(lambda { catalogue }).to contain_class('stdlib') }
  end
end
