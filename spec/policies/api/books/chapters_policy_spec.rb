require "rails_helper"

RSpec.describe Api::Books::ChaptersPolicy do
  subject { described_class }

  context "as signed out user", context: :as_signed_out_user do
    permissions :index? do
      it { is_expected.to permit(current_user) }
    end

    permissions :show? do
      let(:chapter) { create(:chapter) }

      it { is_expected.to permit(current_user, chapter: chapter) }
    end

    permissions :create? do
      it { is_expected.to_not permit(current_user) }
    end

    permissions :update?, :destroy? do
      let(:group) { create(:group) }
      let(:chapter) { create(:chapter, group: group) }

      it { is_expected.to_not permit(current_user, group: group, chapter: chapter) }
    end
  end

  context "as signed in user", context: :as_signed_in_user do
    permissions :index? do
      it { is_expected.to permit(current_user) }
    end

    permissions :show? do
      let(:chapter) { create(:chapter) }

      it { is_expected.to permit(current_user, chapter: chapter) }
    end

    permissions :create? do
      let(:group) { create(:group) }
      let(:chapter) { create(:chapter, group: group) }

      context "with manage chapters access right" do
        before(:each) do
          create(:group_user_with_manage_chapters_access_right, group: group, user: current_user)
        end

        it { is_expected.to permit(current_user, group: group, chapter: chapter) }
      end

      context "without manage chapters access right" do
        it { is_expected.to_not permit(current_user, group: group, chapter: chapter) }
      end
    end

    permissions :update?, :destroy? do
      let(:group) { create(:group) }
      let(:chapter) { create(:chapter, group: group) }

      context "with manage chapters access right" do
        before(:each) do
          create(:group_user_with_manage_chapters_access_right, group: group, user: current_user)
        end

        it { is_expected.to permit(current_user, group: group, chapter: chapter) }
      end

      context "without manage chapters access right" do
        it { is_expected.to_not permit(current_user, group: group, chapter: chapter) }
      end
    end
  end
end
