require 'spec_helper'

describe Registration do

  let(:registration){ Registration.create(name: 'test1', email: 'test@codeschool.com', comment: 'You should never hate regex at all.') }

  describe '#record_company' do
    
    it 'should create company if doesnt exist' do
      expect(registration.company).to eq(nil)
      registration.record_company
      expect(registration.reload.company.class.name).to eq('Company')
    end

    it 'should name of company to domain in email' do
      registration.record_company
      expect(registration.reload.company.name).to eq('codeschool')
    end

  end

  describe '#sub_bad_words' do

    it 'should remove all designated bad words from comment' do
      registration.sub_bad_words
      expect(registration.comment =~ /bad|negative|hate/).to eq(nil)
    end

    it 'should not remove a bad word if not followed by a space and word regex' do
      registration.comment = "This isn't that bad dude."
      registration.sub_bad_words
      expect(registration.comment =~ /bad|negative|hate/).to eq(16)
    end

  end

  describe '#sub_message' do

    it 'should take the warning text out of the message' do
      registration.comment = "Test here. !Sorry, but this comment has been flagged for bad words!"
      registration.sub_message
      expect(registration.comment =~ /(!Sorry.*words!)/).to eq(nil)
    end

  end

end
