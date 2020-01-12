class NewsTicker < ApplicationRecord
    before_create :there_can_only_be_one

    private
    def there_can_only_be_one
        raise "You can create only one row of this table" if NewsTicker.count > 0
    end
end
