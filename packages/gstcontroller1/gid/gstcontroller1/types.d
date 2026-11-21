/// D types for gstcontroller1 library
module gid.gstcontroller1.types;

import gid.core.gid;
import gid.gobject2.value;
import gid.gstcontroller1.c.functions;
import gid.gstcontroller1.c.types;
import gid.gstcontroller1.direct_control_binding;


// Enums

/** */
alias InterpolationMode = GstInterpolationMode;

/** */
alias LFOWaveform = GstLFOWaveform;

// Callbacks

/**
    Function to map a control-value to the target GValue.

    Params:
      self = the #GstDirectControlBinding instance
      srcValue = the value returned by the cotnrol source
      destValue = the target GValue (modified in place, changes are seen by the caller)
*/
alias DirectControlBindingConvertGValue = void delegate(gid.gstcontroller1.direct_control_binding.DirectControlBinding self, double srcValue, gid.gobject2.value.Value destValue);

/**
    Function to map a control-value to the target plain data type.

    Params:
      self = the #GstDirectControlBinding instance
      srcValue = the value returned by the cotnrol source
      destValue = the target location
*/
alias DirectControlBindingConvertValue = void delegate(gid.gstcontroller1.direct_control_binding.DirectControlBinding self, double srcValue, void* destValue);
