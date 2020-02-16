class WebsiteGeneric < ApplicationRecord
    before_create :there_can_only_be_one

    private
    def there_can_only_be_one
        raise "You can create only one row of this table" if WebsiteGeneric.count > 0
    end
end
