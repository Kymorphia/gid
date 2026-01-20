/// Module for [MountOperation] class
module gio.mount_operation;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import glib.types;
import gobject.dclosure;
import gobject.object;

/**
    [gio.mount_operation.MountOperation] provides a mechanism for interacting with the user.
    It can be used for authenticating mountable operations, such as loop
    mounting files, hard drive partitions or server locations. It can
    also be used to ask the user questions or show a list of applications
    preventing unmount or eject operations from completing.
    
    Note that [gio.mount_operation.MountOperation] is used for more than just [gio.mount.Mount]
    objects – for example it is also used in [gio.drive.Drive.start] and
    [gio.drive.Drive.stop].
    
    Users should instantiate a subclass of this that implements all the
    various callbacks to show the required dialogs, such as
    [[gtk.mount_operation.MountOperation]](https://docs.gtk.org/gtk4/class.MountOperation.html).
    If no user interaction is desired (for example when automounting
    filesystems at login time), usually `NULL` can be passed, see each method
    taking a [gio.mount_operation.MountOperation] for details.
    
    Throughout the API, the term ‘TCRYPT’ is used to mean ‘compatible with TrueCrypt and VeraCrypt’.
    [TrueCrypt](https://en.wikipedia.org/wiki/TrueCrypt) is a discontinued system for
    encrypting file containers, partitions or whole disks, typically used with Windows.
    [VeraCrypt](https://www.veracrypt.fr/) is a maintained fork of TrueCrypt with various
    improvements and auditing fixes.
*/
class MountOperation : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_mount_operation_get_type != &gidSymbolNotFound ? g_mount_operation_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MountOperation self()
  {
    return this;
  }

  /**
      Get `anonymous` property.
      Returns: Whether to use an anonymous user when authenticating.
  */
  @property bool anonymous()
  {
    return getAnonymous();
  }

  /**
      Set `anonymous` property.
      Params:
        propval = Whether to use an anonymous user when authenticating.
  */
  @property void anonymous(bool propval)
  {
    return setAnonymous(propval);
  }

  /**
      Get `choice` property.
      Returns: The index of the user's choice when a question is asked during the
        mount operation. See the #GMountOperation::ask-question signal.
  */
  @property int choice()
  {
    return getChoice();
  }

  /**
      Set `choice` property.
      Params:
        propval = The index of the user's choice when a question is asked during the
          mount operation. See the #GMountOperation::ask-question signal.
  */
  @property void choice(int propval)
  {
    return setChoice(propval);
  }

  /**
      Get `domain` property.
      Returns: The domain to use for the mount operation.
  */
  @property string domain()
  {
    return getDomain();
  }

  /**
      Set `domain` property.
      Params:
        propval = The domain to use for the mount operation.
  */
  @property void domain(string propval)
  {
    return setDomain(propval);
  }

  /**
      Get `isTcryptHiddenVolume` property.
      Returns: Whether the device to be unlocked is a TCRYPT hidden volume.
        See [the VeraCrypt documentation](https://www.veracrypt.fr/en/Hidden`20Volume`.html).
  */
  @property bool isTcryptHiddenVolume()
  {
    return getIsTcryptHiddenVolume();
  }

  /**
      Set `isTcryptHiddenVolume` property.
      Params:
        propval = Whether the device to be unlocked is a TCRYPT hidden volume.
          See [the VeraCrypt documentation](https://www.veracrypt.fr/en/Hidden`20Volume`.html).
  */
  @property void isTcryptHiddenVolume(bool propval)
  {
    return setIsTcryptHiddenVolume(propval);
  }

  /**
      Get `isTcryptSystemVolume` property.
      Returns: Whether the device to be unlocked is a TCRYPT system volume.
        In this context, a system volume is a volume with a bootloader
        and operating system installed. This is only supported for Windows
        operating systems. For further documentation, see
        [the VeraCrypt documentation](https://www.veracrypt.fr/en/System`20Encryption`.html).
  */
  @property bool isTcryptSystemVolume()
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
  @property void isTcryptSystemVolume(bool propval)
  {
    return setIsTcryptSystemVolume(propval);
  }

  /**
      Get `password` property.
      Returns: The password that is used for authentication when carrying out
        the mount operation.
  */
  @property string password()
  {
    return getPassword();
  }

  /**
      Set `password` property.
      Params:
        propval = The password that is used for authentication when carrying out
          the mount operation.
  */
  @property void password(string propval)
  {
    return setPassword(propval);
  }

  /**
      Get `passwordSave` property.
      Returns: Determines if and how the password information should be saved.
  */
  @property gio.types.PasswordSave passwordSave()
  {
    return getPasswordSave();
  }

  /**
      Set `passwordSave` property.
      Params:
        propval = Determines if and how the password information should be saved.
  */
  @property void passwordSave(gio.types.PasswordSave propval)
  {
    return setPasswordSave(propval);
  }

  /**
      Get `pim` property.
      Returns: The VeraCrypt PIM value, when unlocking a VeraCrypt volume. See
        [the VeraCrypt documentation](https://www.veracrypt.fr/en/Personal`20Iterations``20Multiplier``20`(PIM).html).
  */
  @property uint pim()
  {
    return getPim();
  }

  /**
      Set `pim` property.
      Params:
        propval = The VeraCrypt PIM value, when unlocking a VeraCrypt volume. See
          [the VeraCrypt documentation](https://www.veracrypt.fr/en/Personal`20Iterations``20Multiplier``20`(PIM).html).
  */
  @property void pim(uint propval)
  {
    return setPim(propval);
  }

  /**
      Get `username` property.
      Returns: The user name that is used for authentication when carrying out
        the mount operation.
  */
  @property string username()
  {
    return getUsername();
  }

  /**
      Set `username` property.
      Params:
        propval = The user name that is used for authentication when carrying out
          the mount operation.
  */
  @property void username(string propval)
  {
    return setUsername(propval);
  }

  /**
      Creates a new mount operation.
      Returns: a #GMountOperation.
  */
  this()
  {
    GMountOperation* _cretval;
    _cretval = g_mount_operation_new();
    this(_cretval, Yes.Take);
  }

  /**
      Check to see whether the mount operation is being used
      for an anonymous user.
      Returns: true if mount operation is anonymous.
  */
  bool getAnonymous()
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
  int getChoice()
  {
    int _retval;
    _retval = g_mount_operation_get_choice(cast(GMountOperation*)this._cPtr);
    return _retval;
  }

  /**
      Gets the domain of the mount operation.
      Returns: a string set to the domain.
  */
  string getDomain()
  {
    const(char)* _cretval;
    _cretval = g_mount_operation_get_domain(cast(GMountOperation*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Check to see whether the mount operation is being used
      for a TCRYPT hidden volume.
      Returns: true if mount operation is for hidden volume.
  */
  bool getIsTcryptHiddenVolume()
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
  bool getIsTcryptSystemVolume()
  {
    bool _retval;
    _retval = cast(bool)g_mount_operation_get_is_tcrypt_system_volume(cast(GMountOperation*)this._cPtr);
    return _retval;
  }

  /**
      Gets a password from the mount operation.
      Returns: a string containing the password within op.
  */
  string getPassword()
  {
    const(char)* _cretval;
    _cretval = g_mount_operation_get_password(cast(GMountOperation*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the state of saving passwords for the mount operation.
      Returns: a #GPasswordSave flag.
  */
  gio.types.PasswordSave getPasswordSave()
  {
    GPasswordSave _cretval;
    _cretval = g_mount_operation_get_password_save(cast(GMountOperation*)this._cPtr);
    gio.types.PasswordSave _retval = cast(gio.types.PasswordSave)_cretval;
    return _retval;
  }

  /**
      Gets a PIM from the mount operation.
      Returns: The VeraCrypt PIM within op.
  */
  uint getPim()
  {
    uint _retval;
    _retval = g_mount_operation_get_pim(cast(GMountOperation*)this._cPtr);
    return _retval;
  }

  /**
      Get the user name from the mount operation.
      Returns: a string containing the user name.
  */
  string getUsername()
  {
    const(char)* _cretval;
    _cretval = g_mount_operation_get_username(cast(GMountOperation*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Emits the #GMountOperation::reply signal.
  
      Params:
        result = a #GMountOperationResult
  */
  void reply(gio.types.MountOperationResult result)
  {
    g_mount_operation_reply(cast(GMountOperation*)this._cPtr, result);
  }

  /**
      Sets the mount operation to use an anonymous user if anonymous is true.
  
      Params:
        anonymous = boolean value.
  */
  void setAnonymous(bool anonymous)
  {
    g_mount_operation_set_anonymous(cast(GMountOperation*)this._cPtr, anonymous);
  }

  /**
      Sets a default choice for the mount operation.
  
      Params:
        choice = an integer.
  */
  void setChoice(int choice)
  {
    g_mount_operation_set_choice(cast(GMountOperation*)this._cPtr, choice);
  }

  /**
      Sets the mount operation's domain.
  
      Params:
        domain = the domain to set.
  */
  void setDomain(string domain = null)
  {
    const(char)* _domain = domain.toCString(No.Alloc);
    g_mount_operation_set_domain(cast(GMountOperation*)this._cPtr, _domain);
  }

  /**
      Sets the mount operation to use a hidden volume if hidden_volume is true.
  
      Params:
        hiddenVolume = boolean value.
  */
  void setIsTcryptHiddenVolume(bool hiddenVolume)
  {
    g_mount_operation_set_is_tcrypt_hidden_volume(cast(GMountOperation*)this._cPtr, hiddenVolume);
  }

  /**
      Sets the mount operation to use a system volume if system_volume is true.
  
      Params:
        systemVolume = boolean value.
  */
  void setIsTcryptSystemVolume(bool systemVolume)
  {
    g_mount_operation_set_is_tcrypt_system_volume(cast(GMountOperation*)this._cPtr, systemVolume);
  }

  /**
      Sets the mount operation's password to password.
  
      Params:
        password = password to set.
  */
  void setPassword(string password = null)
  {
    const(char)* _password = password.toCString(No.Alloc);
    g_mount_operation_set_password(cast(GMountOperation*)this._cPtr, _password);
  }

  /**
      Sets the state of saving passwords for the mount operation.
  
      Params:
        save = a set of #GPasswordSave flags.
  */
  void setPasswordSave(gio.types.PasswordSave save)
  {
    g_mount_operation_set_password_save(cast(GMountOperation*)this._cPtr, save);
  }

  /**
      Sets the mount operation's PIM to pim.
  
      Params:
        pim = an unsigned integer.
  */
  void setPim(uint pim)
  {
    g_mount_operation_set_pim(cast(GMountOperation*)this._cPtr, pim);
  }

  /**
      Sets the user name within op to username.
  
      Params:
        username = input username.
  */
  void setUsername(string username = null)
  {
    const(char)* _username = username.toCString(No.Alloc);
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
  
          $(D void callback(gio.mount_operation.MountOperation mountOperation))
  
          `mountOperation` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectAborted(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.mount_operation.MountOperation)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
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
  
          $(D void callback(string message, string defaultUser, string defaultDomain, gio.types.AskPasswordFlags flags, gio.mount_operation.MountOperation mountOperation))
  
          `message` string containing a message to display to the user. (optional)
  
          `defaultUser` string containing the default user name. (optional)
  
          `defaultDomain` string containing the default domain. (optional)
  
          `flags` a set of #GAskPasswordFlags. (optional)
  
          `mountOperation` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectAskPassword(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == string)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == gio.types.AskPasswordFlags)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gio.mount_operation.MountOperation)))
  && Parameters!T.length < 6)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
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

      _dClosure.cb(_paramTuple[]);
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
  
          $(D void callback(string message, string[] choices, gio.mount_operation.MountOperation mountOperation))
  
          `message` string containing a message to display to the user. (optional)
  
          `choices` an array of strings for each possible choice. (optional)
  
          `mountOperation` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectAskQuestion(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string[])))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gio.mount_operation.MountOperation)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);


      static if (Parameters!T.length > 1)
      {
        auto _cArray = getVal!(char**)(&_paramVals[2]);
        string[] _dArray;
        uint _lenchoices;
        if (_cArray)
          for (; _cArray[_lenchoices] !is null; _lenchoices++)
          break;
        foreach (i; 0 .. _lenchoices)
          _dArray ~= _cArray[i].fromCString(No.Free);
        _paramTuple[1] = _dArray;
      }
      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("ask-question", closure, after);
  }

  /**
      Connect to `Reply` signal.
  
      Emitted when the user has replied to the mount operation.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gio.types.MountOperationResult result, gio.mount_operation.MountOperation mountOperation))
  
          `result` a #GMountOperationResult indicating how the request was handled (optional)
  
          `mountOperation` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectReply(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gio.types.MountOperationResult)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gio.mount_operation.MountOperation)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
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
        application should only respond with [gio.mount_operation.MountOperation.reply] to
        the latest signal (setting #GMountOperation:choice to the choice
        the user made).
        
        If the message contains a line break, the first line should be
        presented as a heading. For example, it may be used as the
        primary text in a #GtkMessageDialog.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(string message, glib.types.Pid[] processes, string[] choices, gio.mount_operation.MountOperation mountOperation))
  
          `message` string containing a message to display to the user. (optional)
  
          `processes` an array of #GPid for processes
              blocking the operation. (optional)
  
          `choices` an array of strings for each possible choice. (optional)
  
          `mountOperation` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectShowProcesses(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == glib.types.Pid[])))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == string[])))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gio.mount_operation.MountOperation)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = gArrayGToD!(glib.types.Pid, GidOwnership.None)(cast(GArray*)getVal!(void*)(&_paramVals[2]));
      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[0]);


      static if (Parameters!T.length > 2)
      {
        auto _cArray = getVal!(char**)(&_paramVals[3]);
        string[] _dArray;
        uint _lenchoices;
        if (_cArray)
          for (; _cArray[_lenchoices] !is null; _lenchoices++)
          break;
        foreach (i; 0 .. _lenchoices)
          _dArray ~= _cArray[i].fromCString(No.Free);
        _paramTuple[2] = _dArray;
      }
      _dClosure.cb(_paramTuple[]);
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
  
          $(D void callback(string message, long timeLeft, long bytesLeft, gio.mount_operation.MountOperation mountOperation))
  
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
  ulong connectShowUnmountProgress(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == long)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == long)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gio.mount_operation.MountOperation)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
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

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("show-unmount-progress", closure, after);
  }
}
