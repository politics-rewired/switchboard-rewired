-- Associate 10DLC campaign after service profile association IFF it IS a 10DLC campaign
create trigger _500_bandwidth_associate_10dlc_campaign
  after update
  on sms.phone_number_requests
  for each row
  when (
    (new.service = 'bandwidth' and new.service_10dlc_campaign_id is not null)
    and ((old.service_profile_associated_at is null) and (new.service_profile_associated_at is not null))
  )
  execute procedure trigger_job_with_sending_account_and_profile_info('associate-service-10dlc-campaign');

-- Complete purchase after 10DLC association IFF it IS a 10DLC campaign
create trigger _500_bandwidth_complete_10dlc_purchase
  before update
  on sms.phone_number_requests
  for each row
  when (
    (new.service = 'bandwidth' and new.service_10dlc_campaign_id is not null)
    and ((old.service_10dlc_campaign_associated_at is null) and (new.service_10dlc_campaign_associated_at is not null))
  )
  execute procedure sms.tg__complete_number_purchase();
