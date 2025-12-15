/// C types for gstcontroller1 library
module gstcontroller.c.types;

public import gid.basictypes;
public import glib.c.types;
public import gmodule.c.types;
public import gobject.c.types;
public import gst.c.types;

/**
    The various interpolation modes available.
*/
enum GstInterpolationMode
{
  /**
      steps-like interpolation, default
  */
  None = 0,

  /**
      linear interpolation
  */
  Linear = 1,

  /**
      cubic interpolation (natural), may overshoot
        the min or max values set by the control point, but is more 'curvy'
  */
  Cubic = 2,

  /**
      monotonic cubic interpolation, will not
        produce any values outside of the min-max range set by the control points
        (Since: 1.8)
  */
  CubicMonotonic = 3,
}

/**
    The various waveform modes available.
*/
enum GstLFOWaveform
{
  /**
      sine waveform
  */
  Sine = 0,

  /**
      square waveform
  */
  Square = 1,

  /**
      saw waveform
  */
  Saw = 2,

  /**
      reverse saw waveform
  */
  ReverseSaw = 3,

  /**
      triangle waveform
  */
  Triangle = 4,
}

/**
    A value mapping object that attaches multiple control sources to a guint
    gobject properties representing a color. A control value of 0.0 will turn the
    color component off and a value of 1.0 will be the color level.
*/
struct GstARGBControlBinding
{
  /** */
  GstControlBinding parent;

  /** */
  GstControlSource* csA;

  /** */
  GstControlSource* csR;

  /** */
  GstControlSource* csG;

  /** */
  GstControlSource* csB;

  /** */
  GValue curValue;

  /** */
  uint lastValue;

  /** */
  void*[4] GstReserved;
}

/**
    The class structure of #GstARGBControlBinding.
*/
struct GstARGBControlBindingClass
{
  /**
      Parent class
  */
  GstControlBindingClass parentClass;

  /** */
  void*[4] GstReserved;
}

/**
    An internal structure for value+time and various temporary
    values used for interpolation. This "inherits" from
    GstTimedValue.
*/
struct GstControlPoint
{
  /**
      timestamp of the value change
  */
  GstClockTime timestamp;

  /**
      the new value
  */
  double value;

  /** */
  /** */
  union CacheType
  {
    /** */
    /** */
    struct CubicType
    {
      /** */
      double h;

      /** */
      double z;
    }

    CubicType cubic;

    /** */
    /** */
    struct CubicMonotonicType
    {
      /** */
      double c1s;

      /** */
      double c2s;

      /** */
      double c3s;
    }

    CubicMonotonicType cubic_monotonic;

    /** */
    ubyte[64] GstReserved;
  }

  CacheType cache;
}

/**
    A value mapping object that attaches control sources to gobject properties. It
    will map the control values directly to the target property range. If a
    non-absolute direct control binding is used, the value range [0.0 ... 1.0]
    is mapped to full target property range, and all values outside the range
    will be clipped. An absolute control binding will not do any value
    transformations.
*/
struct GstDirectControlBinding
{
  /** */
  GstControlBinding parent;

  /** */
  GstControlSource* cs;

  /** */
  GValue curValue;

  /** */
  double lastValue;

  /** */
  int byteSize;

  /** */
  GstDirectControlBindingConvertValue convertValue;

  /** */
  GstDirectControlBindingConvertGValue convertGValue;

  /** */
  /** */
  union ABIType
  {
    /** */
    void*[4] GstReserved;

    /** */
    /** */
    struct AbiType
    {
      /** */
      gboolean wantAbsolute;
    }

    AbiType abi;
  }

  ABIType ABI;
}

/**
    The class structure of #GstDirectControlBinding.
*/
struct GstDirectControlBindingClass
{
  /**
      Parent class
  */
  GstControlBindingClass parentClass;

  /** */
  void*[4] GstReserved;
}

/**
    #GstInterpolationControlSource is a #GstControlSource, that interpolates values between user-given
    control points. It supports several interpolation modes and property types.
    
    To use #GstInterpolationControlSource get a new instance by calling
    [gstcontroller.interpolation_control_source.InterpolationControlSource.new_], bind it to a #GParamSpec and set some
    control points by calling [gstcontroller.timed_value_control_source.TimedValueControlSource.set].
    
    All functions are MT-safe.
*/
struct GstInterpolationControlSource
{
  /** */
  GstTimedValueControlSource parent;

  /** */
  GstInterpolationControlSourcePrivate* priv;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstInterpolationControlSourceClass
{
  /** */
  GstTimedValueControlSourceClass parentClass;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstInterpolationControlSourcePrivate;

/**
    #GstLFOControlSource is a #GstControlSource, that provides several periodic
    waveforms as control values.
    
    To use #GstLFOControlSource get a new instance by calling
    [gstcontroller.lfocontrol_source.LFOControlSource.new_], bind it to a #GParamSpec and set the relevant
    properties.
    
    All functions are MT-safe.
*/
struct GstLFOControlSource
{
  /** */
  GstControlSource parent;

  /** */
  GstLFOControlSourcePrivate* priv;

  /** */
  GMutex lock;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstLFOControlSourceClass
{
  /** */
  GstControlSourceClass parentClass;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstLFOControlSourcePrivate;

/**
    A #GstControlBinding that forwards requests to another #GstControlBinding
*/
struct GstProxyControlBinding
{
  /** */
  GstControlBinding parent;

  /** */
  GWeakRef refObject;

  /** */
  char* propertyName;

  /** */
  void*[4] Padding;
}

/**
    Opaque #GstProxyControlBindingClass struct
*/
struct GstProxyControlBindingClass
{
  /** */
  GstControlBindingClass parentClass;

  /** */
  void*[4] Padding;
}

/**
    Base class for #GstControlSource that use time-stamped values.
    
    When overriding bind, chain up first to give this bind implementation a
    chance to setup things.
    
    All functions are MT-safe.
*/
struct GstTimedValueControlSource
{
  /** */
  GstControlSource parent;

  /** */
  GMutex lock;

  /** */
  GSequence* values;

  /** */
  int nvalues;

  /** */
  gboolean validCache;

  /** */
  GstTimedValueControlSourcePrivate* priv;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstTimedValueControlSourceClass
{
  /** */
  GstControlSourceClass parentClass;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstTimedValueControlSourcePrivate;

/**
    #GstTriggerControlSource is a #GstControlSource, that returns values from user-given
    control points. It allows for a tolerance on the time-stamps.
    
    To use #GstTriggerControlSource get a new instance by calling
    [gstcontroller.trigger_control_source.TriggerControlSource.new_], bind it to a #GParamSpec and set some
    control points by calling [gstcontroller.timed_value_control_source.TimedValueControlSource.set].
    
    All functions are MT-safe.
*/
struct GstTriggerControlSource
{
  /** */
  GstTimedValueControlSource parent;

  /** */
  GstTriggerControlSourcePrivate* priv;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstTriggerControlSourceClass
{
  /** */
  GstTimedValueControlSourceClass parentClass;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstTriggerControlSourcePrivate;

alias extern(C) void function(GstDirectControlBinding* self, double srcValue, GValue* destValue) GstDirectControlBindingConvertGValue;

alias extern(C) void function(GstDirectControlBinding* self, double srcValue, void* destValue) GstDirectControlBindingConvertValue;

