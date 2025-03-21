# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_03_19_004128) do
  create_table "ranks", charset: "utf8mb4", collation: "utf8mb4_bin", comment: "ゲーム内のランキング情報", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "ユーザー"
    t.integer "rank", default: 0, null: false, comment: "ユーザーの順位"
    t.integer "score", default: 0, null: false, comment: "このランクに至ったスコア"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rank"], name: "index_ranks_on_rank"
    t.index ["score"], name: "ranks_score_index"
    t.index ["user_id"], name: "index_ranks_on_user_id", unique: true
  end

  create_table "user_scores", charset: "utf8mb4", collation: "utf8mb4_bin", comment: "ユーザーがゲーム内で獲得した点数", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "ユーザー"
    t.integer "score", default: 0, null: false, comment: "ユーザーが獲得した点数"
    t.datetime "received_at", null: false, comment: "点数を獲得した日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["received_at"], name: "index_user_scores_on_received_at"
    t.index ["user_id"], name: "index_user_scores_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_bin", comment: "ゲームのユーザー情報を管理するテーブル", force: :cascade do |t|
    t.string "name", null: false, comment: "ユーザーの名前"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ranks", "users"
  add_foreign_key "user_scores", "users", on_update: :cascade, on_delete: :cascade
end
