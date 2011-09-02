# -*- coding: utf-8 -*-

# A substitute for ActiveRecord with the methods added by the will_paginate gem
# used by will_paginate to render pagination controls.
class Pagination

  attr_accessor :total_pages, :current_page

  def initialize(total_pages, current_page)
    @total_pages = total_pages
    @current_page = current_page
  end

  def previous_page
    if(current_page - 1 == 0)
      nil
    else
      current_page - 1
    end
  end

  def next_page
    if(current_page == total_pages)
      nil
    else
      current_page + 1
    end
  end

end

class PostsController < ApplicationController
  # GET /posts
  # GET /posts.xml
  def index

    per_page = 5
    total_pages = Post.all.size / per_page
    current_page = params[:page].to_i
    if(current_page == 0 or current_page == 1)
      current_page = 1
      start_id = 1
    else
      start_id = current_page.to_i * per_page
    end

    @pagination = Pagination.new(total_pages, current_page)
    @posts = Post.all(:limit => per_page, :offset => start_id.to_s)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.xml
  def create
    params[:post][:tags] = string2arr(params[:post][:tags])
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # Convert comma separated string to array
  def string2arr(string)
    string.split(",").map{|x| x.strip}
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])
    params[:post][:tags] = string2arr(params[:post][:tags])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
end
