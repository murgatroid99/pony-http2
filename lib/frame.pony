trait Frame
  """
  A single frame in an HTTP2 connection. This represents a slightly idealized
  frame, with CONTINUATION frames merged into their corresponding preceding
  frames
  """
  new empty()

  fun parse(flags: U8, payload: Array[U8]): ((ErrorLevel, ErrorCode) | None)

  fun serialize(): (U8, Array[U8])

  fun is_valid(): Bool

class DataFrame is Frame
  """
  A DATA frame.
  """
  var _end_stream: Bool
  var _data: Array[U8]
  var _padding: U8 = 0

  new create(end_stream: Bool, data: Array[U8], padding: U8 = 0) =>
    _end_stream = end_stream
    _data = data
    _padding = padding

  new empty() =>
    _end_stream = false
    _data = Array

  fun parse(flags: U8, payload: Array[U8]) =>
    _end_stream = (flags & 0x1) != 0
    let padded = (flags & 0x8) != 0
    if padded then
      try
        _padding = payload(0)
        _data = payload.slice(1, payload.size() - _padding)
        None
      else
        (CONNECTION_ERROR, PROTOCOL_ERROR)
      end
    else
      _data = payload
      None
    end

  fun serialize() =>
    var flag_val: U8 = 0
    if _end_stream
      flag_val = flag_val | 0x1
    end
    if _padding > 0
      flag_val = flag_val | 0x8
      var data = Array.init(_padding, 1)
      data.append(_data).append(Array.init(0, _padding))
      (flag_val, data)
    else
      (flag_val, _data)
    end

class HeadersFrame is Frame

class PriorityFrame is Frame

class RstStreamFrame is Frame

class SettingsFrame is Frame

class PushPromiseFrame is Frame

class PingFrame is Frame

class GoAwayFrame is Frame

class WindowUpdateFrame is Frame
