/// D types for gstcontroller1 library
module gstcontroller.types;

import gid.gid;
import gobject.value;
import gstcontroller.c.functions;
import gstcontroller.c.types;
import gstcontroller.direct_control_binding;


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
alias DirectControlBindingConvertGValue = void delegate(gstcontroller.direct_control_binding.DirectControlBinding self, double srcValue, gobject.value.Value destValue);

/**
    Function to map a control-value to the target plain data type.

    Params:
      self = the #GstDirectControlBinding instance
      srcValue = the value returned by the cotnrol source
      destValue = the target location
*/
alias DirectControlBindingConvertValue = void delegate(gstcontroller.direct_control_binding.DirectControlBinding self, double srcValue, void* destValue);
