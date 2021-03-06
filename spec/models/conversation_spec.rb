# == Schema Information
#
# Table name: conversations
#
#  id                          :integer          not null, primary key
#  match_id                    :integer
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  first_user_unread_messages  :integer          default(0)
#  second_user_unread_messages :integer          default(0)
#
# Indexes
#
#  index_conversations_on_match_id  (match_id)
#

require 'rails_helper'

describe Conversation, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:match) }
    it { is_expected.to have_many(:users).through(:user_conversations) }
    it { is_expected.to have_many(:messages).dependent(:destroy) }
  end
end
