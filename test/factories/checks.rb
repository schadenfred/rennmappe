FactoryGirl.define do
  factory :check do
    name "mileage_log"
    description "MyString"
    range_low 1
    range_high 1
    author_id 1
    internal_check false
    measure_units "MyString"
    required false

    factory :sub_check do
    parent_id 1

    end



    factory :check_with_sub_checks do

      transient do
        sub_checks_count 5
      end

      after(:create) do |check, evaluator|
        create_list(:sub_check, evaluator.sub_checks_count, check: check)
      end
    end

  end
end
