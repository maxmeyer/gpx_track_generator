# encoding: utf-8
module GpxTrackGenerator
  # Runner
  class Runner < Thor
    option :file, default: 'track.gpx', desc: 'GPX track file name'
    desc 'generate', 'Generate gpx track'
    argument :gpx_files, type: :array, desc: 'GPX track or route files'
    def generate
      track = Track.new(gpx_files.map { |f| File.expand_path f })

      File.write(options[:file], track.to_s)
    end

    default_command :generate
  end
end
