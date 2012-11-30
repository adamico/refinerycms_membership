module Refinery
  module Memberships
    module MembersHelper
      def def_list_items(attributes)
        attributes.each do |k, v|
          rejected_keys = %w(id username encrypted_password current_sign_in_at last_sign_in_at current_sign_in_ip last_sign_in_ip sign_in_count remember_created_at reset_password_token reset_password_sent_at created_at updated_at enabled seen rejected confirmation_token confirmed_at confirmation_sent_at)
          v = v.blank? ? "<em>not specified</em>".html_safe : v
          v = l(v) if k == "member_until"
          yield(k, v) unless rejected_keys.include? k
        end
      end
    end
  end
end
