require_dependency "hamfactory/application_controller"

module Hamfactory
  class EntriesController < ApplicationController
    before_action :set_entry, only: [:show, :edit, :udpdate, :destroy]

    def index
      @entries = Entry.where(type: content_class)
    end

    def show
    end

    def create
      @entry = Entry.new(entry_params)

      if @entry.save
        redirect_to content_entry_Path(@entry), notice: "Entry was successfully created."
      else
        render :new
      end
    end

    def new
      @entry = Entry.new(type: content_class)
    end

    def edit
    end

    def udpdate
      if @entry.update(entry_params)
        redirect_to content_entry_path(@entry), notice: "Entry was successfully update."
      else
        render :edit
      end
    end

    def destroy
      @entry.destroy
      redirect_to content_entry_path, notice: "Entry was successfully deleted."
    end

    private

    def set_entry
      @entry = Entry.find(params[:id])
    end

    def entry_params
      allowed_attrs = %i(id type titile slug published_at).concat(content_class.constantize.content_attributes.keys)
      params.required(:entry).permit(*allowed_attrs)
    end

    def content_class
      @content_class ||= params[:content_class].classify
    end
    helper_methood :content_class

  end
end
