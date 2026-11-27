/// Module for [MountOperation] class
module gid.gio2.mount_operation;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.types;
import gid.glib2.types;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.mount_operation.MountOperation] provides a mechanism for interacting with the user.
    It can be used for authenticating mountable operations, such as loop
    mounting files, hard drive partitions or server locations. It can
    also be used to ask the user questions or show a list of applications
    preventing unmount or eject operations from completing.
    
    Note that [gid.gio2.mount_operation.MountOperation] is used for more than just [gid.gio2.mount.Mount]
    objects – for example it is also used in [gid.gio2.drive.Drive.start] and
    [gid.gio2.drive.Drive.stop].
    
    Users should instantiate a subclass of this that implements all the
    various callbacks to show the required dialogs, such as
    [[gid.gtk4.mount_operation.MountOperation]](https://docs.gtk.org/gtk4/class.MountOperation.html).
    If no user interaction is desired (for example when automounting
    filesystems at login time), usually `NULL` can be passed, see each method
    taking a [gid.gio2.mount_operation.MountOperation] for details.
    
    Throughout the API, the term ‘TCRYPT’ is used to mean ‘compatible with TrueCrypt and VeraCrypt’.
    [TrueCrypt](https://en.wikipedia.org/wiki/TrueCrypt) is a discontinued system for
    encrypting file containers, partitions or whole disks, typically used with Windows.
    [VeraCrypt](https://www.veracrypt.fr/) is a maintained fork of TrueCrypt with various
    improvements and auditing fixes.
*/
@gidGir("MountOperation", "MountOperationClass")
class MountOperation : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_mount_operation_get_type != &gidSymbolNotFound ? g_mount_operation_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMountOperation";
  }

  /** Returns `this`, for use in `with` statements. */
  override MountOperation self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.mount_operation.MountOperation]
      Returns: New builder object
  */
  static MountOperationGidBuilder builder() nothrow
  {
    return new MountOperationGidBuilder;
  }

  /**
      Get `anonymous` property.
      Returns: Whether to use an anonymous user when authenticating.
  */
  @property bool anonymous() nothrow
  {
    return getAnonymous();
  }

  /**
      Set `anonymous` property.
      Params:
        propval = Whether to use an anonymous user when authenticating.
  */
  @property void anonymous(bool propval) nothrow
  {
    setAnonymous(propval);
  }

  /**
      Get `choice` property.
      Returns: The index of the user's choice when a question is asked during the
        mount operation. See the #GMountOperation::ask-question signal.
  */
  @property int choice() nothrow
  {
    return getChoice();
  }

  /**
      Set `choice` property.
      Params:
        propval = The index of the user's choice when a question is asked during the
          mount operation. See the #GMountOperation::ask-question signal.
  */
  @property void choice(int propval) nothrow
  {
    setChoice(propval);
  }

  /**
      Get `domain` property.
      Returns: The domain to use for the mount operation.
  */
  @property string domain() nothrow
  {
    return getDomain();
  }

  /**
      Set `domain` property.
      Params:
        propval = The domain to use for the mount operation.
  */
  @property void domain(string propval) nothrow
  {
    setDomain(propval);
  }

  /**
      Get `isTcryptHiddenVolume` property.
      Returns: Whether the device to be unlocked is a TCRYPT hidden volume.
        See [the VeraCrypt documentation](https://www.veracrypt.fr/en/Hidden`20Volume`.html).
  */
  @property bool isTcryptHiddenVolume() nothrow
  {
    return getIsTcryptHiddenVolume();
  }

  /**
      Set `isTcryptHiddenVolume` property.
      Params:
        propval = Whether the device to be unlocked is a TCRYPT hidden volume.
          See [the VeraCrypt documentation](https://www.veracrypt.fr/en/Hidden`20Volume`.html).
  */
  @property void isTcryptHiddenVolume(bool propval) nothrow
  {
    setIsTcryptHiddenVolume(propval);
  }

  /**
      Get `isTcryptSystemVolume` property.
      Returns: Whether the device to be unlocked is a TCRYPT system volume.
        In this context, a system volume is a volume with a bootloader
        and operating system installed. This is only supported for Windows
        operating systems. For further documentation, see
        [the VeraCrypt documentation](https://www.veracrypt.fr/en/System`20Encryption`.html).
  */
  @property bool isTcryptSystemVolume() nothrow
  {
    return getIsTcryptSystemVolume();
  }

  /**
      Set `isTcryptSystemVolume` property.
      Params:
        propval = Whether the device to be unlocked is a TCRYPT system volume.
          In this context, a system volume is a volume with a bootloader
          and operating system installed. This is only supported for Windows
          operating systems. For further documentation, see
          [the VeraCrypt documentation](https://www.veracrypt.fr/en/System`20Encryption`.html).
  */
  @property void isTcryptSystemVolume(bool propval) nothrow
  {
    setIsTcryptSystemVolume(propval);
  }

  /**
      Get `password` property.
      Returns: The password that is used for authentication when carrying out
        the mount operation.
  */
  @property string password() nothrow
  {
    return getPassword();
  }

  /**
      Set `password` property.
      Params:
        propval = The password that is used for authentication when carrying out
          the mount operation.
  */
  @property void password(string propval) nothrow
  {
    setPassword(propval);
  }

  /**
      Get `passwordSave` property.
      Returns: Determines if and how the password information should be saved.
  */
  @property gid.gio2.types.PasswordSave passwordSave() nothrow
  {
    return getPasswordSave();
  }

  /**
      Set `passwordSave` property.
      Params:
        propval = Determines if and how the password information should be saved.
  */
  @property void passwordSave(gid.gio2.types.PasswordSave propval) nothrow
  {
    setPasswordSave(propval);
  }

  /**
      Get `pim` property.
      Returns: The VeraCrypt PIM value, when unlocking a VeraCrypt volume. See
        [the VeraCrypt documentation](https://www.veracrypt.fr/en/Personal`20Iterations``20Multiplier``20`(PIM).html).
  */
  @property uint pim() nothrow
  {
    return getPim();
  }

  /**
      Set `pim` property.
      Params:
        propval = The VeraCrypt PIM value, when unlocking a VeraCrypt volume. See
          [the VeraCrypt documentation](https://www.veracrypt.fr/en/Personal`20Iterations``20Multiplier``20`(PIM).html).
  */
  @property void pim(uint propval) nothrow
  {
    setPim(propval);
  }

  /**
      Get `username` property.
      Returns: The user name that is used for authentication when carrying out
        the mount operation.
  */
  @property string username() nothrow
  {
    return getUsername();
  }

  /**
      Set `username` property.
      Params:
        propval = The user name that is used for authentication when carrying out
          the mount operation.
  */
  @property void username(string propval) nothrow
  {
    setUsername(propval);
  }

  /**
      Creates a new mount operation.
      Returns: a #GMountOperation.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GMountOperation* _cretval;
      _cretval = g_mount_operation_new();
      this(_cretval, Yes.Take);
    }
  }

  /** */
  protected void vfuncAborted()
  {
    auto _klass = cast(GMountOperationClass*)_vfuncClass;
    if (!_klass.aborted)
      return;

    _klass.aborted(cast(GMountOperation*)this._cPtr);
  }

  /** */
  protected void vfuncAskPassword(string message, string defaultUser, string defaultDomain, gid.gio2.types.AskPasswordFlags flags)
  {
    auto _klass = cast(GMountOperationClass*)_vfuncClass;
    if (!_klass.askPassword)
      return;

    const(char)* _message = message.toCString!(No.Malloc, No.Nullable);
    const(char)* _defaultUser = defaultUser.toCString!(No.Malloc, No.Nullable);
    const(char)* _defaultDomain = defaultDomain.toCString!(No.Malloc, No.Nullable);
    _klass.askPassword(cast(GMountOperation*)this._cPtr, _message, _defaultUser, _defaultDomain, flags);
  }

  /**
      Virtual implementation of #GMountOperation::ask-question.
  
      Params:
        message = string containing a message to display to the user
        choices = an array of
             strings for each possible choice
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncAskQuestion` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncAskQuestion(string message, string[] choices)
  {
    auto _klass = cast(GMountOperationClass*)_vfuncClass;
    if (!_klass.askQuestion)
      return;

    const(char)* _message = message.toCString!(No.Malloc, No.Nullable);
    auto _choices_arr = new char*[](choices.length + 1);
    auto _choices = cast(char**)_choices_arr.ptr;
    foreach (i, s; choices) _choices[i] = s.toCString!(No.Malloc);
    _klass.askQuestion(cast(GMountOperation*)this._cPtr, _message, _choices);
  }

  /**
      Emits the #GMountOperation::reply signal.
  
      Params:
        result = a #GMountOperationResult
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncReply` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncReply(gid.gio2.types.MountOperationResult result)
  {
    auto _klass = cast(GMountOperationClass*)_vfuncClass;
    if (!_klass.reply)
      return;

    _klass.reply(cast(GMountOperation*)this._cPtr, result);
  }

  /**
      Virtual implementation of #GMountOperation::show-processes.
  
      Params:
        message = string containing a message to display to the user
        processes = an array of #GPid for processes blocking
             the operation
        choices = an array of
             strings for each possible choice
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncShowProcesses` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncShowProcesses(string message, gid.glib2.types.Pid[] processes, string[] choices)
  {
    auto _klass = cast(GMountOperationClass*)_vfuncClass;
    if (!_klass.showProcesses)
      return;

    const(char)* _message = message.toCString!(No.Malloc, No.Nullable);
    auto _processes = gArrayFromD!(gid.glib2.types.Pid, false)(processes);
    scope(exit) containerFree!(GArray*, gid.glib2.types.Pid, GidOwnership.None)(_processes);
    auto _choices_arr = new char*[](choices.length + 1);
    auto _choices = cast(char**)_choices_arr.ptr;
    foreach (i, s; choices) _choices[i] = s.toCString!(No.Malloc);
    _klass.showProcesses(cast(GMountOperation*)this._cPtr, _message, _processes, _choices);
  }

  /** */
  protected void vfuncShowUnmountProgress(string message, long timeLeft, long bytesLeft)
  {
    auto _klass = cast(GMountOperationClass*)_vfuncClass;
    if (!_klass.showUnmountProgress)
      return;

    const(char)* _message = message.toCString!(No.Malloc, No.Nullable);
    _klass.showUnmountProgress(cast(GMountOperation*)this._cPtr, _message, timeLeft, bytesLeft);
  }

  /**
      Check to see whether the mount operation is being used
      for an anonymous user.
      Returns: true if mount operation is anonymous.
  */
  bool getAnonymous() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_mount_operation_get_anonymous(cast(GMountOperation*)this._cPtr);
    return _retval;
  }

  /**
      Gets a choice from the mount operation.
      Returns: an integer containing an index of the user's choice from
        the choice's list, or `0`.
  */
  int getChoice() nothrow
  {
    int _retval;
    _retval = g_mount_operation_get_choice(cast(GMountOperation*)this._cPtr);
    return _retval;
  }

  /**
      Gets the domain of the mount operation.
      Returns: a string set to the domain.
  */
  string getDomain() nothrow
  {
    const(char)* _cretval;
    _cretval = g_mount_operation_get_domain(cast(GMountOperation*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Check to see whether the mount operation is being used
      for a TCRYPT hidden volume.
      Returns: true if mount operation is for hidden volume.
  */
  bool getIsTcryptHiddenVolume() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_mount_operation_get_is_tcrypt_hidden_volume(cast(GMountOperation*)this._cPtr);
    return _retval;
  }

  /**
      Check to see whether the mount operation is being used
      for a TCRYPT system volume.
      Returns: true if mount operation is for system volume.
  */
  bool getIsTcryptSystemVolume() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_mount_operation_get_is_tcrypt_system_volume(cast(GMountOperation*)this._cPtr);
    return _retval;
  }

  /**
      Gets a password from the mount operation.
      Returns: a string containing the password within op.
  */
  string getPassword() nothrow
  {
    const(char)* _cretval;
    _cretval = g_mount_operation_get_password(cast(GMountOperation*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the state of saving passwords for the mount operation.
      Returns: a #GPasswordSave flag.
  */
  gid.gio2.types.PasswordSave getPasswordSave() nothrow
  {
    GPasswordSave _cretval;
    _cretval = g_mount_operation_get_password_save(cast(GMountOperation*)this._cPtr);
    gid.gio2.types.PasswordSave _retval = cast(gid.gio2.types.PasswordSave)_cretval;
    return _retval;
  }

  /**
      Gets a PIM from the mount operation.
      Returns: The VeraCrypt PIM within op.
  */
  uint getPim() nothrow
  {
    uint _retval;
    _retval = g_mount_operation_get_pim(cast(GMountOperation*)this._cPtr);
    return _retval;
  }

  /**
      Get the user name from the mount operation.
      Returns: a string containing the user name.
  */
  string getUsername() nothrow
  {
    const(char)* _cretval;
    _cretval = g_mount_operation_get_username(cast(GMountOperation*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Emits the #GMountOperation::reply signal.
  
      Params:
        result = a #GMountOperationResult
  */
  void reply(gid.gio2.types.MountOperationResult result) nothrow
  {
    g_mount_operation_reply(cast(GMountOperation*)this._cPtr, result);
  }

  /**
      Sets the mount operation to use an anonymous user if anonymous is true.
  
      Params:
        anonymous = boolean value.
  */
  void setAnonymous(bool anonymous) nothrow
  {
    g_mount_operation_set_anonymous(cast(GMountOperation*)this._cPtr, anonymous);
  }

  /**
      Sets a default choice for the mount operation.
  
      Params:
        choice = an integer.
  */
  void setChoice(int choice) nothrow
  {
    g_mount_operation_set_choice(cast(GMountOperation*)this._cPtr, choice);
  }

  /**
      Sets the mount operation's domain.
  
      Params:
        domain = the domain to set.
  */
  void setDomain(string domain = null) nothrow
  {
    const(char)* _domain = domain.toCString!(No.Malloc, Yes.Nullable);
    g_mount_operation_set_domain(cast(GMountOperation*)this._cPtr, _domain);
  }

  /**
      Sets the mount operation to use a hidden volume if hidden_volume is true.
  
      Params:
        hiddenVolume = boolean value.
  */
  void setIsTcryptHiddenVolume(bool hiddenVolume) nothrow
  {
    g_mount_operation_set_is_tcrypt_hidden_volume(cast(GMountOperation*)this._cPtr, hiddenVolume);
  }

  /**
      Sets the mount operation to use a system volume if system_volume is true.
  
      Params:
        systemVolume = boolean value.
  */
  void setIsTcryptSystemVolume(bool systemVolume) nothrow
  {
    g_mount_operation_set_is_tcrypt_system_volume(cast(GMountOperation*)this._cPtr, systemVolume);
  }

  /**
      Sets the mount operation's password to password.
  
      Params:
        password = password to set.
  */
  void setPassword(string password = null) nothrow
  {
    const(char)* _password = password.toCString!(No.Malloc, Yes.Nullable);
    g_mount_operation_set_password(cast(GMountOperation*)this._cPtr, _password);
  }

  /**
      Sets the state of saving passwords for the mount operation.
  
      Params:
        save = a set of #GPasswordSave flags.
  */
  void setPasswordSave(gid.gio2.types.PasswordSave save) nothrow
  {
    g_mount_operation_set_password_save(cast(GMountOperation*)this._cPtr, save);
  }

  /**
      Sets the mount operation's PIM to pim.
  
      Params:
        pim = an unsigned integer.
  */
  void setPim(uint pim) nothrow
  {
    g_mount_operation_set_pim(cast(GMountOperation*)this._cPtr, pim);
  }

  /**
      Sets the user name within op to username.
  
      Params:
        username = input username.
  */
  void setUsername(string username = null) nothrow
  {
    const(char)* _username = username.toCString!(No.Malloc, Yes.Nullable);
    g_mount_operation_set_username(cast(GMountOperation*)this._cPtr, _username);
  }

  /**
      Connect to `Aborted` signal.
  
      Emitted by the backend when e.g. a device becomes unavailable
        while a mount operation is in progress.
        
        Implementations of GMountOperation should handle this signal
        by dismissing open password dialogs.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.mount_operation.MountOperation mountOperation)`
  
          `mountOperation` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectAborted(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.mount_operation.MountOperation)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.mount_operation.MountOperation.aborted");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("aborted", closure, after);
  }

  /**
      Connect to `AskPassword` signal.
  
      Emitted when a mount operation asks the user for a password.
        
        If the message contains a line break, the first line should be
        presented as a heading. For example, it may be used as the
        primary text in a #GtkMessageDialog.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(string message, string defaultUser, string defaultDomain, gid.gio2.types.AskPasswordFlags flags, gid.gio2.mount_operation.MountOperation mountOperation)`
  
          `message` string containing a message to display to the user. (optional)
  
          `defaultUser` string containing the default user name. (optional)
  
          `defaultDomain` string containing the default domain. (optional)
  
          `flags` a set of #GAskPasswordFlags. (optional)
  
          `mountOperation` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectAskPassword(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == string)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == gid.gio2.types.AskPasswordFlags)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gid.gio2.mount_operation.MountOperation)))
  && Parameters!T.length < 6)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 5, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[4]);

      static if (Parameters!T.length > 4)
        _paramTuple[4] = getVal!(Parameters!T[4])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.mount_operation.MountOperation.askPassword");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("ask-password", closure, after);
  }

  /**
      Connect to `AskQuestion` signal.
  
      Emitted when asking the user a question and gives a list of
        choices for the user to choose from.
        
        If the message contains a line break, the first line should be
        presented as a heading. For example, it may be used as the
        primary text in a #GtkMessageDialog.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(string message, string[] choices, gid.gio2.mount_operation.MountOperation mountOperation)`
  
          `message` string containing a message to display to the user. (optional)
  
          `choices` an array of strings for each possible choice. (optional)
  
          `mountOperation` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectAskQuestion(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string[])))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gio2.mount_operation.MountOperation)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.mount_operation.MountOperation.askQuestion");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("ask-question", closure, after);
  }

  /**
      Connect to `Reply` signal.
  
      Emitted when the user has replied to the mount operation.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.types.MountOperationResult result, gid.gio2.mount_operation.MountOperation mountOperation)`
  
          `result` a #GMountOperationResult indicating how the request was handled (optional)
  
          `mountOperation` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectReply(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gio2.types.MountOperationResult)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.mount_operation.MountOperation)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.mount_operation.MountOperation.reply");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("reply", closure, after);
  }

  /**
      Connect to `ShowProcesses` signal.
  
      Emitted when one or more processes are blocking an operation
        e.g. unmounting/ejecting a #GMount or stopping a #GDrive.
        
        Note that this signal may be emitted several times to update the
        list of blocking processes as processes close files. The
        application should only respond with [gid.gio2.mount_operation.MountOperation.reply] to
        the latest signal (setting #GMountOperation:choice to the choice
        the user made).
        
        If the message contains a line break, the first line should be
        presented as a heading. For example, it may be used as the
        primary text in a #GtkMessageDialog.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(string message, gid.glib2.types.Pid[] processes, string[] choices, gid.gio2.mount_operation.MountOperation mountOperation)`
  
          `message` string containing a message to display to the user. (optional)
  
          `processes` an array of #GPid for processes
              blocking the operation. (optional)
  
          `choices` an array of strings for each possible choice. (optional)
  
          `mountOperation` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectShowProcesses(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.glib2.types.Pid[])))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == string[])))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gid.gio2.mount_operation.MountOperation)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = gArrayToD!(gid.glib2.types.Pid, GidOwnership.None)(cast(GArray*)getVal!(void*)(&_paramVals[2]));

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.mount_operation.MountOperation.showProcesses");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("show-processes", closure, after);
  }

  /**
      Connect to `ShowUnmountProgress` signal.
  
      Emitted when an unmount operation has been busy for more than some time
        (typically 1.5 seconds).
        
        When unmounting or ejecting a volume, the kernel might need to flush
        pending data in its buffers to the volume stable storage, and this operation
        can take a considerable amount of time. This signal may be emitted several
        times as long as the unmount operation is outstanding, and then one
        last time when the operation is completed, with bytes_left set to zero.
        
        Implementations of GMountOperation should handle this signal by
        showing an UI notification, and then dismiss it, or show another notification
        of completion, when bytes_left reaches zero.
        
        If the message contains a line break, the first line should be
        presented as a heading. For example, it may be used as the
        primary text in a #GtkMessageDialog.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(string message, long timeLeft, long bytesLeft, gid.gio2.mount_operation.MountOperation mountOperation)`
  
          `message` string containing a message to display to the user (optional)
  
          `timeLeft` the estimated time left before the operation completes,
                in microseconds, or -1 (optional)
  
          `bytesLeft` the amount of bytes to be written before the operation
                completes (or -1 if such amount is not known), or zero if the operation
                is completed (optional)
  
          `mountOperation` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectShowUnmountProgress(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == long)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == long)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gid.gio2.mount_operation.MountOperation)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.mount_operation.MountOperation.showUnmountProgress");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("show-unmount-progress", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from MountOperation
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gio2.mount_operation.MountOperation), T.stringof ~ " is not derived from gid.gio2.mount_operation.MountOperation");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAborted", true)[0]) == gid.gio2.mount_operation.MountOperation))
      _installVfunc(klass, "aborted");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAskPassword", true)[0]) == gid.gio2.mount_operation.MountOperation))
      _installVfunc(klass, "ask_password");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAskQuestion", true)[0]) == gid.gio2.mount_operation.MountOperation))
      _installVfunc(klass, "ask_question");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncReply", true)[0]) == gid.gio2.mount_operation.MountOperation))
      _installVfunc(klass, "reply");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncShowProcesses", true)[0]) == gid.gio2.mount_operation.MountOperation))
      _installVfunc(klass, "show_processes");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncShowUnmountProgress", true)[0]) == gid.gio2.mount_operation.MountOperation))
      _installVfunc(klass, "show_unmount_progress");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GMountOperationClass*)klass;

    switch (vfunc)
    {
      case "aborted":
      {
        static extern(C) void _vfuncAbortedTramp(GMountOperation* op) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.mount_operation.MountOperation)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)op);
          if (!_obj)
          {
            auto _klass = cast(GMountOperationClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)op);
            if (_klass.aborted)
              return (cast(typeof(&_vfuncAbortedTramp))_klass.aborted)(op);
            return;
          }

          try
          {
            _obj.vfuncAborted();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.mount_operation.MountOperation.vfuncAborted");
          }
        }

        _klass.aborted = cast(typeof(_klass.aborted))&_vfuncAbortedTramp;
        break;
      }
      case "ask_password":
      {
        static extern(C) void _vfuncAskPasswordTramp(GMountOperation* op, const(char)* message, const(char)* defaultUser, const(char)* defaultDomain, GAskPasswordFlags flags) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.mount_operation.MountOperation)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)op);
          if (!_obj)
          {
            auto _klass = cast(GMountOperationClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)op);
            if (_klass.askPassword)
              return (cast(typeof(&_vfuncAskPasswordTramp))_klass.askPassword)(op, message, defaultUser, defaultDomain, flags);
            return;
          }

          string _message = message.fromCString!(No.Free);
          string _defaultUser = defaultUser.fromCString!(No.Free);
          string _defaultDomain = defaultDomain.fromCString!(No.Free);

          try
          {
            _obj.vfuncAskPassword(_message, _defaultUser, _defaultDomain, flags);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.mount_operation.MountOperation.vfuncAskPassword");
          }
        }

        _klass.askPassword = cast(typeof(_klass.askPassword))&_vfuncAskPasswordTramp;
        break;
      }
      case "ask_question":
      {
        static extern(C) void _vfuncAskQuestionTramp(GMountOperation* op, const(char)* message, const(char*)* choices) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.mount_operation.MountOperation)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)op);
          if (!_obj)
          {
            auto _klass = cast(GMountOperationClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)op);
            if (_klass.askQuestion)
              return (cast(typeof(&_vfuncAskQuestionTramp))_klass.askQuestion)(op, message, choices);
            return;
          }

          string _message = message.fromCString!(No.Free);
          string[] _choices;
          uint _lenchoices;
          if (choices)
          {
            for (; choices[_lenchoices] !is null; _lenchoices++)
            {
            }
          }

          _choices.length = _lenchoices;
          foreach (i; 0 .. _lenchoices)
            _choices[i] = choices[i].fromCString!(No.Free);

          try
          {
            _obj.vfuncAskQuestion(_message, _choices);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.mount_operation.MountOperation.vfuncAskQuestion");
          }
        }

        _klass.askQuestion = cast(typeof(_klass.askQuestion))&_vfuncAskQuestionTramp;
        break;
      }
      case "reply":
      {
        static extern(C) void _vfuncReplyTramp(GMountOperation* op, GMountOperationResult result) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.mount_operation.MountOperation)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)op);
          if (!_obj)
          {
            auto _klass = cast(GMountOperationClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)op);
            if (_klass.reply)
              return (cast(typeof(&_vfuncReplyTramp))_klass.reply)(op, result);
            return;
          }

          try
          {
            _obj.vfuncReply(result);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.mount_operation.MountOperation.vfuncReply");
          }
        }

        _klass.reply = cast(typeof(_klass.reply))&_vfuncReplyTramp;
        break;
      }
      case "show_processes":
      {
        static extern(C) void _vfuncShowProcessesTramp(GMountOperation* op, const(char)* message, GArray* processes, const(char*)* choices) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.mount_operation.MountOperation)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)op);
          if (!_obj)
          {
            auto _klass = cast(GMountOperationClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)op);
            if (_klass.showProcesses)
              return (cast(typeof(&_vfuncShowProcessesTramp))_klass.showProcesses)(op, message, processes, choices);
            return;
          }

          string _message = message.fromCString!(No.Free);
          auto _processes = gArrayToD!(gid.glib2.types.Pid, GidOwnership.None)(processes);
          string[] _choices;
          uint _lenchoices;
          if (choices)
          {
            for (; choices[_lenchoices] !is null; _lenchoices++)
            {
            }
          }

          _choices.length = _lenchoices;
          foreach (i; 0 .. _lenchoices)
            _choices[i] = choices[i].fromCString!(No.Free);

          try
          {
            _obj.vfuncShowProcesses(_message, _processes, _choices);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.mount_operation.MountOperation.vfuncShowProcesses");
          }
        }

        _klass.showProcesses = cast(typeof(_klass.showProcesses))&_vfuncShowProcessesTramp;
        break;
      }
      case "show_unmount_progress":
      {
        static extern(C) void _vfuncShowUnmountProgressTramp(GMountOperation* op, const(char)* message, long timeLeft, long bytesLeft) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.mount_operation.MountOperation)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)op);
          if (!_obj)
          {
            auto _klass = cast(GMountOperationClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)op);
            if (_klass.showUnmountProgress)
              return (cast(typeof(&_vfuncShowUnmountProgressTramp))_klass.showUnmountProgress)(op, message, timeLeft, bytesLeft);
            return;
          }

          string _message = message.fromCString!(No.Free);

          try
          {
            _obj.vfuncShowUnmountProgress(_message, timeLeft, bytesLeft);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.mount_operation.MountOperation.vfuncShowUnmountProgress");
          }
        }

        _klass.showUnmountProgress = cast(typeof(_klass.showUnmountProgress))&_vfuncShowUnmountProgressTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.mount_operation.MountOperation]
class MountOperationGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `anonymous` property.
      Params:
        propval = Whether to use an anonymous user when authenticating.
      Returns: Builder instance for fluent chaining
  */
  T anonymous(bool propval) nothrow
  {
    return setProperty("anonymous", propval);
  }

  /**
      Set `choice` property.
      Params:
        propval = The index of the user's choice when a question is asked during the
          mount operation. See the #GMountOperation::ask-question signal.
      Returns: Builder instance for fluent chaining
  */
  T choice(int propval) nothrow
  {
    return setProperty("choice", propval);
  }

  /**
      Set `domain` property.
      Params:
        propval = The domain to use for the mount operation.
      Returns: Builder instance for fluent chaining
  */
  T domain(string propval) nothrow
  {
    return setProperty("domain", propval);
  }

  /**
      Set `isTcryptHiddenVolume` property.
      Params:
        propval = Whether the device to be unlocked is a TCRYPT hidden volume.
          See [the VeraCrypt documentation](https://www.veracrypt.fr/en/Hidden`20Volume`.html).
      Returns: Builder instance for fluent chaining
  */
  T isTcryptHiddenVolume(bool propval) nothrow
  {
    return setProperty("is-tcrypt-hidden-volume", propval);
  }

  /**
      Set `isTcryptSystemVolume` property.
      Params:
        propval = Whether the device to be unlocked is a TCRYPT system volume.
          In this context, a system volume is a volume with a bootloader
          and operating system installed. This is only supported for Windows
          operating systems. For further documentation, see
          [the VeraCrypt documentation](https://www.veracrypt.fr/en/System`20Encryption`.html).
      Returns: Builder instance for fluent chaining
  */
  T isTcryptSystemVolume(bool propval) nothrow
  {
    return setProperty("is-tcrypt-system-volume", propval);
  }

  /**
      Set `password` property.
      Params:
        propval = The password that is used for authentication when carrying out
          the mount operation.
      Returns: Builder instance for fluent chaining
  */
  T password(string propval) nothrow
  {
    return setProperty("password", propval);
  }

  /**
      Set `passwordSave` property.
      Params:
        propval = Determines if and how the password information should be saved.
      Returns: Builder instance for fluent chaining
  */
  T passwordSave(gid.gio2.types.PasswordSave propval) nothrow
  {
    return setProperty("password-save", propval);
  }

  /**
      Set `pim` property.
      Params:
        propval = The VeraCrypt PIM value, when unlocking a VeraCrypt volume. See
          [the VeraCrypt documentation](https://www.veracrypt.fr/en/Personal`20Iterations``20Multiplier``20`(PIM).html).
      Returns: Builder instance for fluent chaining
  */
  T pim(uint propval) nothrow
  {
    return setProperty("pim", propval);
  }

  /**
      Set `username` property.
      Params:
        propval = The user name that is used for authentication when carrying out
          the mount operation.
      Returns: Builder instance for fluent chaining
  */
  T username(string propval) nothrow
  {
    return setProperty("username", propval);
  }
}

/// Fluent builder for [gid.gio2.mount_operation.MountOperation]
final class MountOperationGidBuilder : MountOperationGidBuilderImpl!MountOperationGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MountOperation build() nothrow
  {
    return new MountOperation(cast(void*)createGObject(MountOperation._getGType), Yes.Take);
  }
}
