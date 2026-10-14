require "test_helper"

class ManagedFileTest < ActiveSupport::TestCase
  def build_file(name)
    managed_file = ManagedFile.new(name: name)
    managed_file.file.attach(io: file_fixture("sample.txt").open, filename: "sample.txt", content_type: "text/plain")
    managed_file
  end

  test "is valid with a unique name and a file" do
    assert build_file("new-file").valid?
  end

  test "requires a name" do
    managed_file = build_file("")
    assert_not managed_file.valid?
    assert_includes managed_file.errors[:name], "can't be blank"
  end

  test "requires a unique name" do
    managed_file = build_file(managed_files(:one).name)
    assert_not managed_file.valid?
    assert_includes managed_file.errors[:name], "has already been taken"
  end

  test "requires a file" do
    managed_file = ManagedFile.new(name: "no-file")
    assert_not managed_file.valid?
    assert managed_file.errors[:file].any?
  end

  test "builds an escaped stream path" do
    assert_equal "/managed_files/stream/menu%20with%20spaces", ManagedFile.new(name: "menu with spaces").streamed_filename_path
  end
end
