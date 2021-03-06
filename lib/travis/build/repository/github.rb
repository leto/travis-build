module Travis
  class Build
    module Repository
      class Github
        attr_reader :scm, :slug

        def initialize(scm, slug)
          @scm  = scm
          @slug = slug
        end

        def checkout(commit)
          scm.fetch(source_url, commit, slug)
        end

        def config_url(commit)
          "https://raw.github.com/#{slug}/#{commit}/.travis.yml"
        end

        def source_url
          "git://github.com/#{slug}.git"
        end
      end
    end
  end
end
