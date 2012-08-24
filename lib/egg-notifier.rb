require "net/http"
require "json"
require "time"

# The gemspec uses the full path of the version file, and 1.8 requires
# it twice if the path is different. So we expand_path here, too.
require File.expand_path('../egg-notifier/version', __FILE__)

require "egg-notifier/configuration"
require "egg-notifier/egg"
require "egg-notifier/egg/notifier"
require "egg-notifier/egg/exceptions"
