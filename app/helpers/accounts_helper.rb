module AccountsHelper

  def profile_picture(account, size)
    image_tag(account.image_url, width: size, height: size, class: "imx-auto d-block rounded-circle")
  end

  def can_edit_profile? profile_id
    account_signed_in? && current_account.id == profile_id
  end
end
