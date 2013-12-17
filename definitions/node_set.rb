#
# Cookbook Name:: chef-solo-node
# Definition:: node_set
#
# Copyright 2013, FancyGuy Technologies
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'json'

define :node_set do

  params[:data_bag_path] ||= File.expand_path File.join(Chef::Config[:data_bag_path], 'node')
  node_file = File.expand_path File.join(params[:data_bag_path], "#{params[:name]}.json")

  Chef::Log.debug("Node file is located at: #{node_file}")
  
  # Ensure the node directory exists
  FileUtils.mkdir_p params[:data_bag_path] unless File.exists? params[:data_bag_path]

  # Remove any previous instance of the node
  File.delete(node_file) if File.exists? node_file

  persist_node = { "id" => node[:hostname] }
  persist_node.merge!(node)

  Chef::Log.info("Persisting node object to node data bag")
  File.open node_file, 'w' do |f|
    f.write JSON.pretty_generate(JSON.parse(persist_node.to_json))
  end

end
