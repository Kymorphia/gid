/// D types for gstpbutils1 library
module gstpbutils.types;

import gid.gid;
import gstpbutils.audio_visualizer;
import gstpbutils.c.functions;
import gstpbutils.c.types;
import gstvideo.video_frame;


// Enums

/** */
alias AudioVisualizerShader = GstAudioVisualizerShader;

/** */
alias DiscovererResult = GstDiscovererResult;

/** */
alias DiscovererSerializeFlags = GstDiscovererSerializeFlags;

/** */
alias InstallPluginsReturn = GstInstallPluginsReturn;

/** */
alias PbUtilsCapsDescriptionFlags = GstPbUtilsCapsDescriptionFlags;

// Callbacks

/** */
alias AudioVisualizerShaderFunc = void delegate(gstpbutils.audio_visualizer.AudioVisualizer scope_, gstvideo.video_frame.VideoFrame s, gstvideo.video_frame.VideoFrame d);

/**
    The prototype of the callback function that will be called once the
    external plugin installer program has returned. You only need to provide
    a callback function if you are using the asynchronous interface.

    Params:
      result = whether the installation of the requested plugins succeeded or not
*/
alias InstallPluginsResultFunc = void delegate(gstpbutils.types.InstallPluginsReturn result);

/**
    #GstEncodingTarget category for recording and capture.
    Targets within this category are optimized for low latency encoding.
*/
enum ENCODING_CATEGORY_CAPTURE = "capture";

/**
    #GstEncodingTarget category for device-specific targets.
    The name of the target will usually be the constructor and model of the device,
    and that target will contain #GstEncodingProfiles suitable for that device.
*/
enum ENCODING_CATEGORY_DEVICE = "device";

/**
    #GstEncodingTarget category for file extensions.
    The name of the target will be the name of the file extensions possible
    for a particular target. Those targets are defining like 'default' formats
    usually used for a particular file extension.
*/
enum ENCODING_CATEGORY_FILE_EXTENSION = "file-extension";

/**
    #GstEncodingTarget category for online-services.
    The name of the target will usually be the name of the online service
    and that target will contain #GstEncodingProfiles suitable for that online
    service.
*/
enum ENCODING_CATEGORY_ONLINE_SERVICE = "online-service";

/**
    #GstEncodingTarget category for storage, archiving and editing targets.
    Those targets can be lossless and/or provide very fast random access content.
    The name of the target will usually be the container type or editing target,
    and that target will contain #GstEncodingProfiles suitable for editing or
    storage.
*/
enum ENCODING_CATEGORY_STORAGE_EDITING = "storage-editing";

/**
    The major version of GStreamer's gst-plugins-base libraries at compile time.
*/
enum PLUGINS_BASE_VERSION_MAJOR = 1;

/**
    The micro version of GStreamer's gst-plugins-base libraries at compile time.
*/
enum PLUGINS_BASE_VERSION_MICRO = 2;

/**
    The minor version of GStreamer's gst-plugins-base libraries at compile time.
*/
enum PLUGINS_BASE_VERSION_MINOR = 28;

/**
    The nano version of GStreamer's gst-plugins-base libraries at compile time.
    Actual releases have 0, GIT versions have 1, prerelease versions have 2-...
*/
enum PLUGINS_BASE_VERSION_NANO = 0;
