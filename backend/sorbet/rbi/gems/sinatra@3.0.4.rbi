# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `sinatra` gem.
# Please instead update this file by running `bin/tapioca gem sinatra`.

class Rack::Builder
  include ::Sinatra::Delegator

  def initialize(default_app = T.unsafe(nil), &block); end

  def call(env); end
  def freeze_app; end
  def map(path, &block); end
  def run(app); end
  def to_app; end
  def use(middleware, *args, **_arg2, &block); end
  def warmup(prc = T.unsafe(nil), &block); end

  private

  def generate_map(default_app, mapping); end

  class << self
    def app(default_app = T.unsafe(nil), &block); end
    def load_file(path, opts = T.unsafe(nil)); end
    def new_from_string(builder_script, file = T.unsafe(nil)); end
    def parse_file(config, opts = T.unsafe(nil)); end
  end
end

Rack::Builder::UTF_8_BOM = T.let(T.unsafe(nil), String)

module Sinatra
  class << self
    def helpers(*extensions, &block); end
    def new(base = T.unsafe(nil), &block); end
    def register(*extensions, &block); end
    def use(*args, &block); end
  end
end

class Sinatra::Application < ::Sinatra::Base
  include ::Sinatra::EngineTracking
  include ::Sinatra::Capture
  include ::Sinatra::ContentFor
  include ::Sinatra::Cookies
  include ::Sinatra::LinkHeader
  include ::Sinatra::Streaming
  include ::Sinatra::RequiredParams
  include ::Sinatra::RespondWith::Helpers
  extend ::Sinatra::Contrib::Common
  extend ::Sinatra::ConfigFile
  extend ::Sinatra::MultiRoute
  extend ::Sinatra::Namespace
  extend ::Sinatra::Namespace::SharedMethods
  extend ::Sinatra::Namespace::BaseMethods
  extend ::Sinatra::RespondWith
  extend ::Sinatra::Reloader
  extend ::Sinatra::Reloader::BaseMethods
  extend ::Sinatra::Reloader::ExtensionMethods

  class << self
    def app_file; end
    def app_file=(val); end
    def app_file?; end
    def environments; end
    def environments=(val); end
    def environments?; end
    def ext_map; end
    def ext_map=(val); end
    def ext_map?; end
    def logging; end
    def logging=(val); end
    def logging?; end
    def method_override; end
    def method_override=(val); end
    def method_override?; end
    def register(*extensions, &block); end
    def reload_templates; end
    def reload_templates=(val); end
    def reload_templates?; end
    def reloader; end
    def reloader=(val); end
    def reloader?; end
    def run; end
    def run=(val); end
    def run?; end
    def template_engines; end
    def template_engines=(val); end
    def template_engines?; end
  end
end

class Sinatra::BadRequest < ::Sinatra::Error
  def http_status; end
end

class Sinatra::Base
  include ::Rack::Utils
  include ::Sinatra::Helpers
  include ::Sinatra::Templates
  include ::Sinatra::JSON

  def initialize(app = T.unsafe(nil), **_kwargs); end

  def app; end
  def app=(_arg0); end
  def call(env); end
  def call!(env); end
  def env; end
  def env=(_arg0); end
  def forward; end
  def halt(*response); end
  def params; end
  def params=(_arg0); end
  def pass(&block); end
  def request; end
  def request=(_arg0); end
  def response; end
  def response=(_arg0); end
  def settings; end
  def template_cache; end

  private

  def dispatch!; end
  def dump_errors!(boom); end
  def error_block!(key, *block_params); end
  def filter!(type, base = T.unsafe(nil), &block); end
  def force_encoding(*args); end
  def handle_exception!(boom); end
  def invoke(&block); end
  def process_route(pattern, conditions, block = T.unsafe(nil), values = T.unsafe(nil)); end
  def route!(base = T.unsafe(nil), pass_block = T.unsafe(nil)); end
  def route_eval; end
  def route_missing; end
  def static!(options = T.unsafe(nil)); end

  class << self
    def absolute_redirects; end
    def absolute_redirects=(val); end
    def absolute_redirects?; end
    def add_charset; end
    def add_charset=(val); end
    def add_charset?; end
    def add_filter(type, path = T.unsafe(nil), **options, &block); end
    def after(path = T.unsafe(nil), **options, &block); end
    def app_file; end
    def app_file=(val); end
    def app_file?; end
    def before(path = T.unsafe(nil), **options, &block); end
    def bind; end
    def bind=(val); end
    def bind?; end
    def build(app); end
    def call(env); end
    def caller_files; end
    def condition(name = T.unsafe(nil), &block); end
    def configure(*envs); end
    def default_content_type; end
    def default_content_type=(val); end
    def default_content_type?; end
    def default_encoding; end
    def default_encoding=(val); end
    def default_encoding?; end
    def delete(path, opts = T.unsafe(nil), &block); end
    def development?; end
    def disable(*opts); end
    def dump_errors; end
    def dump_errors=(val); end
    def dump_errors?; end
    def empty_path_info; end
    def empty_path_info=(val); end
    def empty_path_info?; end
    def enable(*opts); end
    def environment; end
    def environment=(val); end
    def environment?; end
    def error(*codes, &block); end
    def errors; end
    def extensions; end
    def filters; end
    def force_encoding(data, encoding = T.unsafe(nil)); end
    def get(path, opts = T.unsafe(nil), &block); end
    def handler_name; end
    def handler_name=(val); end
    def handler_name?; end
    def head(path, opts = T.unsafe(nil), &block); end
    def helpers(*extensions, &block); end
    def inline_templates=(file = T.unsafe(nil)); end
    def json_content_type; end
    def json_content_type=(val); end
    def json_content_type?; end
    def json_encoder; end
    def json_encoder=(val); end
    def json_encoder?; end
    def layout(name = T.unsafe(nil), &block); end
    def link(path, opts = T.unsafe(nil), &block); end
    def lock; end
    def lock=(val); end
    def lock?; end
    def logging; end
    def logging=(val); end
    def logging?; end
    def method_override; end
    def method_override=(val); end
    def method_override?; end
    def methodoverride=(val); end
    def methodoverride?; end
    def middleware; end
    def mime_type(type, value = T.unsafe(nil)); end
    def mime_types(type); end
    def mustermann_opts; end
    def mustermann_opts=(val); end
    def mustermann_opts?; end
    def new(*args, **_arg1, &block); end
    def new!(*_arg0); end
    def not_found(&block); end
    def options(path, opts = T.unsafe(nil), &block); end
    def patch(path, opts = T.unsafe(nil), &block); end
    def port; end
    def port=(val); end
    def port?; end
    def post(path, opts = T.unsafe(nil), &block); end
    def prefixed_redirects; end
    def prefixed_redirects=(val); end
    def prefixed_redirects?; end
    def production?; end
    def protection; end
    def protection=(val); end
    def protection?; end
    def prototype; end
    def public=(value); end
    def public_dir; end
    def public_dir=(value); end
    def public_folder; end
    def public_folder=(val); end
    def public_folder?; end
    def put(path, opts = T.unsafe(nil), &block); end
    def quiet; end
    def quiet=(val); end
    def quiet?; end
    def quit!; end
    def raise_errors; end
    def raise_errors=(val); end
    def raise_errors?; end
    def register(*extensions, &block); end
    def reload_templates; end
    def reload_templates=(val); end
    def reload_templates?; end
    def reset!; end
    def root; end
    def root=(val); end
    def root?; end
    def routes; end
    def run; end
    def run!(options = T.unsafe(nil), &block); end
    def run=(val); end
    def run?; end
    def running?; end
    def running_server; end
    def running_server=(val); end
    def running_server?; end
    def server; end
    def server=(val); end
    def server?; end
    def session_secret; end
    def session_secret=(val); end
    def session_secret?; end
    def session_store; end
    def session_store=(val); end
    def session_store?; end
    def sessions; end
    def sessions=(val); end
    def sessions?; end
    def set(option, value = T.unsafe(nil), ignore_setter = T.unsafe(nil), &block); end
    def settings; end
    def show_exceptions; end
    def show_exceptions=(val); end
    def show_exceptions?; end
    def start!(options = T.unsafe(nil), &block); end
    def static; end
    def static=(val); end
    def static?; end
    def static_cache_control; end
    def static_cache_control=(val); end
    def static_cache_control?; end
    def stop!; end
    def strict_paths; end
    def strict_paths=(val); end
    def strict_paths?; end
    def template(name, &block); end
    def templates; end
    def test?; end
    def threaded; end
    def threaded=(val); end
    def threaded?; end
    def traps; end
    def traps=(val); end
    def traps?; end
    def unlink(path, opts = T.unsafe(nil), &block); end
    def use(middleware, *args, **_arg2, &block); end
    def use_code; end
    def use_code=(val); end
    def use_code?; end
    def views; end
    def views=(val); end
    def views?; end
    def x_cascade; end
    def x_cascade=(val); end
    def x_cascade?; end

    private

    def agent(pattern); end
    def cleaned_caller(keep = T.unsafe(nil)); end
    def compile(path, route_mustermann_opts = T.unsafe(nil)); end
    def compile!(verb, path, block, **options); end
    def define_singleton(name, content = T.unsafe(nil)); end
    def generate_method(method_name, &block); end
    def host_name(pattern); end
    def inherited(subclass); end
    def invoke_hook(name, *args); end
    def provides(*types); end
    def route(verb, path, options = T.unsafe(nil), &block); end
    def setup_common_logger(builder); end
    def setup_custom_logger(builder); end
    def setup_default_middleware(builder); end
    def setup_logging(builder); end
    def setup_middleware(builder); end
    def setup_null_logger(builder); end
    def setup_protection(builder); end
    def setup_sessions(builder); end
    def setup_traps; end
    def start_server(handler, server_settings, handler_name); end
    def suppress_messages?; end
    def synchronize(&block); end
    def user_agent(pattern); end
    def warn_for_deprecation(message); end
  end
end

Sinatra::Base::URI_INSTANCE = T.let(T.unsafe(nil), URI::RFC2396_Parser)

class Sinatra::CommonLogger < ::Rack::CommonLogger
  def call(env); end
end

module Sinatra::Delegator
  private

  def after(*args, **_arg1, &block); end
  def after_reload(*args, **_arg1, &block); end
  def also_reload(*args, **_arg1, &block); end
  def before(*args, **_arg1, &block); end
  def config_file(*args, **_arg1, &block); end
  def configure(*args, **_arg1, &block); end
  def delete(*args, **_arg1, &block); end
  def development?(*args, **_arg1, &block); end
  def disable(*args, **_arg1, &block); end
  def dont_reload(*args, **_arg1, &block); end
  def enable(*args, **_arg1, &block); end
  def error(*args, **_arg1, &block); end
  def get(*args, **_arg1, &block); end
  def head(*args, **_arg1, &block); end
  def helpers(*args, **_arg1, &block); end
  def layout(*args, **_arg1, &block); end
  def link(*args, **_arg1, &block); end
  def mime_type(*args, **_arg1, &block); end
  def namespace(*args, **_arg1, &block); end
  def not_found(*args, **_arg1, &block); end
  def options(*args, **_arg1, &block); end
  def patch(*args, **_arg1, &block); end
  def post(*args, **_arg1, &block); end
  def production?(*args, **_arg1, &block); end
  def put(*args, **_arg1, &block); end
  def register(*args, **_arg1, &block); end
  def remap_extensions(*args, **_arg1, &block); end
  def rendering_method(*args, **_arg1, &block); end
  def respond_to(*args, **_arg1, &block); end
  def route(*args, **_arg1, &block); end
  def set(*args, **_arg1, &block); end
  def settings(*args, **_arg1, &block); end
  def template(*args, **_arg1, &block); end
  def test?(*args, **_arg1, &block); end
  def unlink(*args, **_arg1, &block); end
  def use(*args, **_arg1, &block); end

  class << self
    def delegate(*methods); end
    def target; end
    def target=(_arg0); end
  end
end

class Sinatra::Error < ::StandardError; end

class Sinatra::ExtendedRack < ::Struct
  def call(env); end

  private

  def after_response(&block); end
  def async?(status, _headers, body); end
  def setup_close(env, _status, _headers, body); end
end

module Sinatra::Helpers
  def attachment(filename = T.unsafe(nil), disposition = T.unsafe(nil)); end
  def back; end
  def bad_request?; end
  def body(value = T.unsafe(nil), &block); end
  def cache_control(*values); end
  def client_error?; end
  def content_type(type = T.unsafe(nil), params = T.unsafe(nil)); end
  def error(code, body = T.unsafe(nil)); end
  def etag(value, options = T.unsafe(nil)); end
  def expires(amount, *values); end
  def headers(hash = T.unsafe(nil)); end
  def informational?; end
  def last_modified(time); end
  def logger; end
  def mime_type(type); end
  def not_found(body = T.unsafe(nil)); end
  def not_found?; end
  def redirect(uri, *args); end
  def redirect?; end
  def send_file(path, opts = T.unsafe(nil)); end
  def server_error?; end
  def session; end
  def status(value = T.unsafe(nil)); end
  def stream(keep_open = T.unsafe(nil)); end
  def success?; end
  def time_for(value); end
  def to(addr = T.unsafe(nil), absolute = T.unsafe(nil), add_script_name = T.unsafe(nil)); end
  def uri(addr = T.unsafe(nil), absolute = T.unsafe(nil), add_script_name = T.unsafe(nil)); end
  def url(addr = T.unsafe(nil), absolute = T.unsafe(nil), add_script_name = T.unsafe(nil)); end

  private

  def etag_matches?(list, new_resource = T.unsafe(nil)); end
  def with_params(temp_params); end
end

Sinatra::Helpers::ETAG_KINDS = T.let(T.unsafe(nil), Array)
Sinatra::Helpers::MULTIPART_FORM_DATA_REPLACEMENT_TABLE = T.let(T.unsafe(nil), Hash)

class Sinatra::Helpers::Stream
  def initialize(scheduler = T.unsafe(nil), keep_open = T.unsafe(nil), &back); end

  def <<(data); end
  def callback(&block); end
  def close; end
  def closed?; end
  def each(&front); end
  def errback(&block); end

  class << self
    def defer(*_arg0); end
    def schedule(*_arg0); end
  end
end

class Sinatra::IndifferentHash < ::Hash
  def initialize(*args); end

  def [](key); end
  def []=(key, value); end
  def assoc(key); end
  def compact; end
  def default(*args); end
  def default=(value); end
  def delete(key); end
  def dig(key, *other_keys); end
  def fetch(key, *args); end
  def fetch_values(*keys); end
  def has_key?(key); end
  def has_value?(value); end
  def include?(key); end
  def key(value); end
  def key?(key); end
  def member?(key); end
  def merge(*other_hashes, &block); end
  def merge!(*other_hashes); end
  def rassoc(value); end
  def reject(*args, &block); end
  def replace(other_hash); end
  def select(*args, &block); end
  def slice(*keys); end
  def store(key, value); end
  def transform_keys(&block); end
  def transform_keys!; end
  def transform_values(&block); end
  def transform_values!; end
  def update(*other_hashes); end
  def value?(value); end
  def values_at(*keys); end

  private

  def convert_key(key); end
  def convert_value(value); end

  class << self
    def [](*args); end
  end
end

class Sinatra::NotFound < ::Sinatra::Error
  def http_status; end
end

class Sinatra::Request < ::Rack::Request
  def accept; end
  def accept?(type); end
  def forwarded?; end
  def idempotent?; end
  def link?; end
  def params; end
  def preferred_type(*types); end
  def safe?; end
  def secure?; end
  def unlink?; end
end

class Sinatra::Request::AcceptEntry
  def initialize(entry); end

  def <=>(other); end
  def entry; end
  def method_missing(*args, &block); end
  def params; end
  def params=(_arg0); end
  def priority; end
  def respond_to?(*args); end
  def to_s(full = T.unsafe(nil)); end
  def to_str; end
end

Sinatra::Request::HEADER_PARAM = T.let(T.unsafe(nil), Regexp)
Sinatra::Request::HEADER_VALUE_WITH_PARAMS = T.let(T.unsafe(nil), Regexp)

class Sinatra::Request::MimeTypeEntry
  def initialize(entry); end

  def accepts?(entry); end
  def matches_params?(params); end
  def params; end
  def to_str; end
end

class Sinatra::Response < ::Rack::Response
  def body=(value); end
  def each; end
  def finish; end

  private

  def calculate_content_length?; end
  def drop_body?; end
  def drop_content_info?; end
end

Sinatra::Response::DROP_BODY_RESPONSES = T.let(T.unsafe(nil), Array)

class Sinatra::ShowExceptions < ::Rack::ShowExceptions
  def initialize(app); end

  def call(env); end
  def template; end

  private

  def bad_request?(exception); end
  def frame_class(frame); end
  def prefers_plain_text?(env); end
end

Sinatra::ShowExceptions::TEMPLATE = T.let(T.unsafe(nil), ERB)

module Sinatra::Templates
  def initialize; end

  def asciidoc(template, options = T.unsafe(nil), locals = T.unsafe(nil)); end
  def builder(template = T.unsafe(nil), options = T.unsafe(nil), locals = T.unsafe(nil), &block); end
  def erb(template, options = T.unsafe(nil), locals = T.unsafe(nil), &block); end
  def find_template(views, name, engine); end
  def haml(template, options = T.unsafe(nil), locals = T.unsafe(nil), &block); end
  def liquid(template, options = T.unsafe(nil), locals = T.unsafe(nil), &block); end
  def markaby(template = T.unsafe(nil), options = T.unsafe(nil), locals = T.unsafe(nil), &block); end
  def markdown(template, options = T.unsafe(nil), locals = T.unsafe(nil)); end
  def nokogiri(template = T.unsafe(nil), options = T.unsafe(nil), locals = T.unsafe(nil), &block); end
  def rabl(template, options = T.unsafe(nil), locals = T.unsafe(nil)); end
  def rdoc(template, options = T.unsafe(nil), locals = T.unsafe(nil)); end
  def slim(template, options = T.unsafe(nil), locals = T.unsafe(nil), &block); end
  def yajl(template, options = T.unsafe(nil), locals = T.unsafe(nil)); end

  private

  def compile_block_template(template, options, &body); end
  def compile_template(engine, data, options, views); end
  def render(engine, data, options = T.unsafe(nil), locals = T.unsafe(nil), &block); end
  def render_ruby(engine, template, options = T.unsafe(nil), locals = T.unsafe(nil), &block); end
end

module Sinatra::Templates::ContentTyped
  def content_type; end
  def content_type=(_arg0); end
end

Sinatra::VERSION = T.let(T.unsafe(nil), String)

class Sinatra::Wrapper
  def initialize(stack, instance); end

  def call(env); end
  def helpers; end
  def inspect; end
  def settings; end
end