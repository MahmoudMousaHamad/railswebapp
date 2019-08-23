# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_08_23_141923) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.text "about"
    t.integer "year"
    t.string "author"
    t.integer "pages"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "publisher_id"
    t.index ["publisher_id"], name: "index_books_on_publisher_id"
  end

  create_table "books_subjects", id: false, force: :cascade do |t|
    t.integer "subject_id", null: false
    t.integer "book_id", null: false
    t.index ["book_id"], name: "index_books_subjects_on_book_id"
    t.index ["subject_id"], name: "index_books_subjects_on_subject_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "about"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "tagline"
    t.integer "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "colleges", force: :cascade do |t|
    t.string "name"
    t.text "about"
    t.integer "university_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "lat"
    t.float "lng"
    t.index ["university_id"], name: "index_colleges_on_university_id"
  end

  create_table "conferences", force: :cascade do |t|
    t.string "name"
    t.text "about"
    t.integer "city_id"
    t.integer "country_id"
    t.string "website"
    t.string "organizer"
    t.text "papers"
    t.float "lat"
    t.float "lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "from_date"
    t.datetime "to_date"
    t.integer "category_id"
    t.index ["category_id"], name: "index_conferences_on_category_id"
    t.index ["city_id"], name: "index_conferences_on_city_id"
    t.index ["country_id"], name: "index_conferences_on_country_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.text "about"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "disciplines", force: :cascade do |t|
    t.string "name"
    t.text "about"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "issues", force: :cascade do |t|
    t.integer "number"
    t.integer "year"
    t.integer "pageFrom"
    t.integer "pageTo"
    t.integer "journal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["journal_id"], name: "index_issues_on_journal_id"
  end

  create_table "journals", force: :cascade do |t|
    t.string "title"
    t.string "about"
    t.integer "coverageFrom"
    t.integer "coverageTo"
    t.integer "publisher_id"
    t.string "issn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publisher_id"], name: "index_journals_on_publisher_id"
  end

  create_table "journals_subjects", id: false, force: :cascade do |t|
    t.integer "journal_id", null: false
    t.integer "subject_id", null: false
    t.index ["journal_id", "subject_id"], name: "index_journals_subjects_on_journal_id_and_subject_id"
    t.index ["subject_id", "journal_id"], name: "index_journals_subjects_on_subject_id_and_journal_id"
  end

  create_table "museums", force: :cascade do |t|
    t.string "name"
    t.text "about"
    t.integer "city_id"
    t.integer "country_id"
    t.string "website"
    t.text "ticket_price"
    t.text "working_hours"
    t.float "lat"
    t.float "lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_museums_on_city_id"
    t.index ["country_id"], name: "index_museums_on_country_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "country_id"
    t.integer "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_posts_on_city_id"
    t.index ["country_id"], name: "index_posts_on_country_id"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name"
    t.text "about"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scholarships", force: :cascade do |t|
    t.string "name"
    t.text "about"
    t.string "degree"
    t.text "scholarship"
    t.datetime "deadline"
    t.integer "university_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "country_id"
    t.integer "category_id"
    t.index ["category_id"], name: "index_scholarships_on_category_id"
    t.index ["country_id"], name: "index_scholarships_on_country_id"
    t.index ["university_id"], name: "index_scholarships_on_university_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.text "about"
    t.text "professors"
    t.integer "college_id"
    t.integer "university_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["college_id"], name: "index_schools_on_college_id"
    t.index ["university_id"], name: "index_schools_on_university_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "name"
    t.text "about"
    t.integer "city_id"
    t.integer "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.float "lat"
    t.float "lng"
    t.index ["city_id"], name: "index_sites_on_city_id"
    t.index ["country_id"], name: "index_sites_on_country_id"
    t.index ["user_id"], name: "index_sites_on_user_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.text "about"
    t.integer "discipline_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discipline_id"], name: "index_subjects_on_discipline_id"
  end

  create_table "universities", force: :cascade do |t|
    t.string "name"
    t.text "about"
    t.integer "city_id"
    t.integer "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "lat"
    t.float "lng"
    t.index ["city_id"], name: "index_universities_on_city_id"
    t.index ["country_id"], name: "index_universities_on_country_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.integer "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_videos_on_country_id"
  end

end
