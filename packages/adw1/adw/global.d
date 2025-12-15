/// Global functions for adw1 library
module adw.global;

import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gtk.widget;


/**
    Checks whether animations are enabled for widget.
    
    This should be used when implementing an animated widget to know whether to
    animate it or not.

    Params:
      widget = a [gtk.widget.Widget]
    Returns: whether animations are enabled for widget
*/
bool getEnableAnimations(gtk.widget.Widget widget)
{
  bool _retval;
  _retval = cast(bool)adw_get_enable_animations(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Returns the major version number of the Adwaita library.
    
    For example, in libadwaita version 1.2.3 this is 1.
    
    This function is in the library, so it represents the libadwaita library your
    code is running against. Contrast with the `constMAJOR_VERSION` constant,
    which represents the major version of the libadwaita headers you have
    included when compiling your code.
    Returns: the major version number of the Adwaita library
*/
uint getMajorVersion()
{
  uint _retval;
  _retval = adw_get_major_version();
  return _retval;
}

/**
    Returns the micro version number of the Adwaita library.
    
    For example, in libadwaita version 1.2.3 this is 3.
    
    This function is in the library, so it represents the libadwaita library your
    code is running against. Contrast with the `constMAJOR_VERSION` constant,
    which represents the micro version of the libadwaita headers you have
    included when compiling your code.
    Returns: the micro version number of the Adwaita library
*/
uint getMicroVersion()
{
  uint _retval;
  _retval = adw_get_micro_version();
  return _retval;
}

/**
    Returns the minor version number of the Adwaita library.
    
    For example, in libadwaita version 1.2.3 this is 2.
    
    This function is in the library, so it represents the libadwaita library your
    code is running against. Contrast with the `constMAJOR_VERSION` constant,
    which represents the minor version of the libadwaita headers you have
    included when compiling your code.
    Returns: the minor version number of the Adwaita library
*/
uint getMinorVersion()
{
  uint _retval;
  _retval = adw_get_minor_version();
  return _retval;
}

/**
    Initializes Libadwaita.
    
    This function can be used instead of `funcGtk.init` as it initializes GTK
    implicitly.
    
    There's no need to call this function if you're using `classApplication`.
    
    If Libadwaita has already been initialized, the function will simply return.
    
    This makes sure translations, types, themes, and icons for the Adwaita
    library are set up properly.
*/
void init_()
{
  adw_init();
}

/**
    Use this function to check if libadwaita has been initialized with
    `funcinit`.
    Returns: the initialization status
*/
bool isInitialized()
{
  bool _retval;
  _retval = cast(bool)adw_is_initialized();
  return _retval;
}

/**
    Computes the linear interpolation between `a` and `b` for `t`.

    Params:
      a = the start
      b = the end
      t = the interpolation rate
    Returns: the computed value
*/
double lerp(double a, double b, double t)
{
  double _retval;
  _retval = adw_lerp(a, b, t);
  return _retval;
}
