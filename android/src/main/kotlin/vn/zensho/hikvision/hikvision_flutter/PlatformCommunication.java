// Autogenerated from Pigeon (v3.1.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

package vn.zensho.hikvision.hikvision_flutter;

import android.util.Log;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.common.StandardMessageCodec;
import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

/** Generated class from Pigeon. */
@SuppressWarnings({"unused", "unchecked", "CodeBlock2Expr", "RedundantSuppression"})
public class PlatformCommunication {

  /** Generated class from Pigeon that represents data sent in messages. */
  public static class LoginRequest {
    private @NonNull String ip;
    public @NonNull String getIp() { return ip; }
    public void setIp(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"ip\" is null.");
      }
      this.ip = setterArg;
    }

    private @NonNull Long port;
    public @NonNull Long getPort() { return port; }
    public void setPort(@NonNull Long setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"port\" is null.");
      }
      this.port = setterArg;
    }

    private @NonNull String username;
    public @NonNull String getUsername() { return username; }
    public void setUsername(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"username\" is null.");
      }
      this.username = setterArg;
    }

    private @NonNull String password;
    public @NonNull String getPassword() { return password; }
    public void setPassword(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"password\" is null.");
      }
      this.password = setterArg;
    }

    private @NonNull Long channelNo;
    public @NonNull Long getChannelNo() { return channelNo; }
    public void setChannelNo(@NonNull Long setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"channelNo\" is null.");
      }
      this.channelNo = setterArg;
    }

    /** Constructor is private to enforce null safety; use Builder. */
    private LoginRequest() {}
    public static final class Builder {
      private @Nullable String ip;
      public @NonNull Builder setIp(@NonNull String setterArg) {
        this.ip = setterArg;
        return this;
      }
      private @Nullable Long port;
      public @NonNull Builder setPort(@NonNull Long setterArg) {
        this.port = setterArg;
        return this;
      }
      private @Nullable String username;
      public @NonNull Builder setUsername(@NonNull String setterArg) {
        this.username = setterArg;
        return this;
      }
      private @Nullable String password;
      public @NonNull Builder setPassword(@NonNull String setterArg) {
        this.password = setterArg;
        return this;
      }
      private @Nullable Long channelNo;
      public @NonNull Builder setChannelNo(@NonNull Long setterArg) {
        this.channelNo = setterArg;
        return this;
      }
      public @NonNull LoginRequest build() {
        LoginRequest pigeonReturn = new LoginRequest();
        pigeonReturn.setIp(ip);
        pigeonReturn.setPort(port);
        pigeonReturn.setUsername(username);
        pigeonReturn.setPassword(password);
        pigeonReturn.setChannelNo(channelNo);
        return pigeonReturn;
      }
    }
    @NonNull Map<String, Object> toMap() {
      Map<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("ip", ip);
      toMapResult.put("port", port);
      toMapResult.put("username", username);
      toMapResult.put("password", password);
      toMapResult.put("channelNo", channelNo);
      return toMapResult;
    }
    static @NonNull LoginRequest fromMap(@NonNull Map<String, Object> map) {
      LoginRequest pigeonResult = new LoginRequest();
      Object ip = map.get("ip");
      pigeonResult.setIp((String)ip);
      Object port = map.get("port");
      pigeonResult.setPort((port == null) ? null : ((port instanceof Integer) ? (Integer)port : (Long)port));
      Object username = map.get("username");
      pigeonResult.setUsername((String)username);
      Object password = map.get("password");
      pigeonResult.setPassword((String)password);
      Object channelNo = map.get("channelNo");
      pigeonResult.setChannelNo((channelNo == null) ? null : ((channelNo instanceof Integer) ? (Integer)channelNo : (Long)channelNo));
      return pigeonResult;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static class AccsResponse {
    private @NonNull String status;
    public @NonNull String getStatus() { return status; }
    public void setStatus(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"status\" is null.");
      }
      this.status = setterArg;
    }

    private @Nullable String errorMessage;
    public @Nullable String getErrorMessage() { return errorMessage; }
    public void setErrorMessage(@Nullable String setterArg) {
      this.errorMessage = setterArg;
    }

    /** Constructor is private to enforce null safety; use Builder. */
    private AccsResponse() {}
    public static final class Builder {
      private @Nullable String status;
      public @NonNull Builder setStatus(@NonNull String setterArg) {
        this.status = setterArg;
        return this;
      }
      private @Nullable String errorMessage;
      public @NonNull Builder setErrorMessage(@Nullable String setterArg) {
        this.errorMessage = setterArg;
        return this;
      }
      public @NonNull AccsResponse build() {
        AccsResponse pigeonReturn = new AccsResponse();
        pigeonReturn.setStatus(status);
        pigeonReturn.setErrorMessage(errorMessage);
        return pigeonReturn;
      }
    }
    @NonNull Map<String, Object> toMap() {
      Map<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("status", status);
      toMapResult.put("errorMessage", errorMessage);
      return toMapResult;
    }
    static @NonNull AccsResponse fromMap(@NonNull Map<String, Object> map) {
      AccsResponse pigeonResult = new AccsResponse();
      Object status = map.get("status");
      pigeonResult.setStatus((String)status);
      Object errorMessage = map.get("errorMessage");
      pigeonResult.setErrorMessage((String)errorMessage);
      return pigeonResult;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static class PlaybackRequest {
    private @NonNull String timeFrom;
    public @NonNull String getTimeFrom() { return timeFrom; }
    public void setTimeFrom(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"timeFrom\" is null.");
      }
      this.timeFrom = setterArg;
    }

    private @NonNull String timeTo;
    public @NonNull String getTimeTo() { return timeTo; }
    public void setTimeTo(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"timeTo\" is null.");
      }
      this.timeTo = setterArg;
    }

    /** Constructor is private to enforce null safety; use Builder. */
    private PlaybackRequest() {}
    public static final class Builder {
      private @Nullable String timeFrom;
      public @NonNull Builder setTimeFrom(@NonNull String setterArg) {
        this.timeFrom = setterArg;
        return this;
      }
      private @Nullable String timeTo;
      public @NonNull Builder setTimeTo(@NonNull String setterArg) {
        this.timeTo = setterArg;
        return this;
      }
      public @NonNull PlaybackRequest build() {
        PlaybackRequest pigeonReturn = new PlaybackRequest();
        pigeonReturn.setTimeFrom(timeFrom);
        pigeonReturn.setTimeTo(timeTo);
        return pigeonReturn;
      }
    }
    @NonNull Map<String, Object> toMap() {
      Map<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("timeFrom", timeFrom);
      toMapResult.put("timeTo", timeTo);
      return toMapResult;
    }
    static @NonNull PlaybackRequest fromMap(@NonNull Map<String, Object> map) {
      PlaybackRequest pigeonResult = new PlaybackRequest();
      Object timeFrom = map.get("timeFrom");
      pigeonResult.setTimeFrom((String)timeFrom);
      Object timeTo = map.get("timeTo");
      pigeonResult.setTimeTo((String)timeTo);
      return pigeonResult;
    }
  }

  public interface Result<T> {
    void success(T result);
    void error(Throwable error);
  }
  private static class HikvisionSdkCodec extends StandardMessageCodec {
    public static final HikvisionSdkCodec INSTANCE = new HikvisionSdkCodec();
    private HikvisionSdkCodec() {}
    @Override
    protected Object readValueOfType(byte type, ByteBuffer buffer) {
      switch (type) {
        case (byte)128:         
          return AccsResponse.fromMap((Map<String, Object>) readValue(buffer));
        
        case (byte)129:         
          return LoginRequest.fromMap((Map<String, Object>) readValue(buffer));
        
        case (byte)130:         
          return PlaybackRequest.fromMap((Map<String, Object>) readValue(buffer));
        
        default:        
          return super.readValueOfType(type, buffer);
        
      }
    }
    @Override
    protected void writeValue(ByteArrayOutputStream stream, Object value)     {
      if (value instanceof AccsResponse) {
        stream.write(128);
        writeValue(stream, ((AccsResponse) value).toMap());
      } else 
      if (value instanceof LoginRequest) {
        stream.write(129);
        writeValue(stream, ((LoginRequest) value).toMap());
      } else 
      if (value instanceof PlaybackRequest) {
        stream.write(130);
        writeValue(stream, ((PlaybackRequest) value).toMap());
      } else 
{
        super.writeValue(stream, value);
      }
    }
  }

  /** Generated interface from Pigeon that represents a handler of messages from Flutter.*/
  public interface HikvisionSdk {
    void initialize(Result<AccsResponse> result);
    void login(@NonNull LoginRequest request, Result<AccsResponse> result);
    void logout(Result<AccsResponse> result);
    void startLive(Result<AccsResponse> result);
    void stopLive(Result<AccsResponse> result);
    void startPlayback(@NonNull PlaybackRequest request, Result<AccsResponse> result);
    void pausePlayback(Result<AccsResponse> result);
    void resumePlayback(Result<AccsResponse> result);
    void refreshPlayback(Result<AccsResponse> result);
    void getPlaybackSnapshot(Result<AccsResponse> result);
    void playPlaybackFast(Result<AccsResponse> result);
    void playPlaybackSlow(Result<AccsResponse> result);
    void playPlaybackNormalSpeed(Result<AccsResponse> result);
    void openPlaybackSound(Result<AccsResponse> result);
    void closePlaybackSound(Result<AccsResponse> result);
    void setPlaybackVolume(@NonNull Long volumePercent, Result<AccsResponse> result);
    void searchPlaybackFilesInRange(@NonNull String fromTime, @NonNull String toTime, Result<AccsResponse> result);

    /** The codec used by HikvisionSdk. */
    static MessageCodec<Object> getCodec() {
      return HikvisionSdkCodec.INSTANCE;
    }

    /** Sets up an instance of `HikvisionSdk` to handle messages through the `binaryMessenger`. */
    static void setup(BinaryMessenger binaryMessenger, HikvisionSdk api) {
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.HikvisionSdk.initialize", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              Result<AccsResponse> resultCallback = new Result<AccsResponse>() {
                public void success(AccsResponse result) {
                  wrapped.put("result", result);
                  reply.reply(wrapped);
                }
                public void error(Throwable error) {
                  wrapped.put("error", wrapError(error));
                  reply.reply(wrapped);
                }
              };

              api.initialize(resultCallback);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
              reply.reply(wrapped);
            }
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.HikvisionSdk.login", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              ArrayList<Object> args = (ArrayList<Object>)message;
              LoginRequest requestArg = (LoginRequest)args.get(0);
              if (requestArg == null) {
                throw new NullPointerException("requestArg unexpectedly null.");
              }
              Result<AccsResponse> resultCallback = new Result<AccsResponse>() {
                public void success(AccsResponse result) {
                  wrapped.put("result", result);
                  reply.reply(wrapped);
                }
                public void error(Throwable error) {
                  wrapped.put("error", wrapError(error));
                  reply.reply(wrapped);
                }
              };

              api.login(requestArg, resultCallback);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
              reply.reply(wrapped);
            }
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.HikvisionSdk.logout", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              Result<AccsResponse> resultCallback = new Result<AccsResponse>() {
                public void success(AccsResponse result) {
                  wrapped.put("result", result);
                  reply.reply(wrapped);
                }
                public void error(Throwable error) {
                  wrapped.put("error", wrapError(error));
                  reply.reply(wrapped);
                }
              };

              api.logout(resultCallback);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
              reply.reply(wrapped);
            }
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.HikvisionSdk.startLive", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              Result<AccsResponse> resultCallback = new Result<AccsResponse>() {
                public void success(AccsResponse result) {
                  wrapped.put("result", result);
                  reply.reply(wrapped);
                }
                public void error(Throwable error) {
                  wrapped.put("error", wrapError(error));
                  reply.reply(wrapped);
                }
              };

              api.startLive(resultCallback);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
              reply.reply(wrapped);
            }
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.HikvisionSdk.stopLive", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              Result<AccsResponse> resultCallback = new Result<AccsResponse>() {
                public void success(AccsResponse result) {
                  wrapped.put("result", result);
                  reply.reply(wrapped);
                }
                public void error(Throwable error) {
                  wrapped.put("error", wrapError(error));
                  reply.reply(wrapped);
                }
              };

              api.stopLive(resultCallback);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
              reply.reply(wrapped);
            }
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.HikvisionSdk.startPlayback", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              ArrayList<Object> args = (ArrayList<Object>)message;
              PlaybackRequest requestArg = (PlaybackRequest)args.get(0);
              if (requestArg == null) {
                throw new NullPointerException("requestArg unexpectedly null.");
              }
              Result<AccsResponse> resultCallback = new Result<AccsResponse>() {
                public void success(AccsResponse result) {
                  wrapped.put("result", result);
                  reply.reply(wrapped);
                }
                public void error(Throwable error) {
                  wrapped.put("error", wrapError(error));
                  reply.reply(wrapped);
                }
              };

              api.startPlayback(requestArg, resultCallback);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
              reply.reply(wrapped);
            }
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.HikvisionSdk.pausePlayback", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              Result<AccsResponse> resultCallback = new Result<AccsResponse>() {
                public void success(AccsResponse result) {
                  wrapped.put("result", result);
                  reply.reply(wrapped);
                }
                public void error(Throwable error) {
                  wrapped.put("error", wrapError(error));
                  reply.reply(wrapped);
                }
              };

              api.pausePlayback(resultCallback);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
              reply.reply(wrapped);
            }
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.HikvisionSdk.resumePlayback", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              Result<AccsResponse> resultCallback = new Result<AccsResponse>() {
                public void success(AccsResponse result) {
                  wrapped.put("result", result);
                  reply.reply(wrapped);
                }
                public void error(Throwable error) {
                  wrapped.put("error", wrapError(error));
                  reply.reply(wrapped);
                }
              };

              api.resumePlayback(resultCallback);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
              reply.reply(wrapped);
            }
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.HikvisionSdk.refreshPlayback", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              Result<AccsResponse> resultCallback = new Result<AccsResponse>() {
                public void success(AccsResponse result) {
                  wrapped.put("result", result);
                  reply.reply(wrapped);
                }
                public void error(Throwable error) {
                  wrapped.put("error", wrapError(error));
                  reply.reply(wrapped);
                }
              };

              api.refreshPlayback(resultCallback);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
              reply.reply(wrapped);
            }
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.HikvisionSdk.getPlaybackSnapshot", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              Result<AccsResponse> resultCallback = new Result<AccsResponse>() {
                public void success(AccsResponse result) {
                  wrapped.put("result", result);
                  reply.reply(wrapped);
                }
                public void error(Throwable error) {
                  wrapped.put("error", wrapError(error));
                  reply.reply(wrapped);
                }
              };

              api.getPlaybackSnapshot(resultCallback);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
              reply.reply(wrapped);
            }
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.HikvisionSdk.playPlaybackFast", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              Result<AccsResponse> resultCallback = new Result<AccsResponse>() {
                public void success(AccsResponse result) {
                  wrapped.put("result", result);
                  reply.reply(wrapped);
                }
                public void error(Throwable error) {
                  wrapped.put("error", wrapError(error));
                  reply.reply(wrapped);
                }
              };

              api.playPlaybackFast(resultCallback);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
              reply.reply(wrapped);
            }
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.HikvisionSdk.playPlaybackSlow", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              Result<AccsResponse> resultCallback = new Result<AccsResponse>() {
                public void success(AccsResponse result) {
                  wrapped.put("result", result);
                  reply.reply(wrapped);
                }
                public void error(Throwable error) {
                  wrapped.put("error", wrapError(error));
                  reply.reply(wrapped);
                }
              };

              api.playPlaybackSlow(resultCallback);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
              reply.reply(wrapped);
            }
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.HikvisionSdk.playPlaybackNormalSpeed", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              Result<AccsResponse> resultCallback = new Result<AccsResponse>() {
                public void success(AccsResponse result) {
                  wrapped.put("result", result);
                  reply.reply(wrapped);
                }
                public void error(Throwable error) {
                  wrapped.put("error", wrapError(error));
                  reply.reply(wrapped);
                }
              };

              api.playPlaybackNormalSpeed(resultCallback);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
              reply.reply(wrapped);
            }
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.HikvisionSdk.openPlaybackSound", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              Result<AccsResponse> resultCallback = new Result<AccsResponse>() {
                public void success(AccsResponse result) {
                  wrapped.put("result", result);
                  reply.reply(wrapped);
                }
                public void error(Throwable error) {
                  wrapped.put("error", wrapError(error));
                  reply.reply(wrapped);
                }
              };

              api.openPlaybackSound(resultCallback);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
              reply.reply(wrapped);
            }
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.HikvisionSdk.closePlaybackSound", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              Result<AccsResponse> resultCallback = new Result<AccsResponse>() {
                public void success(AccsResponse result) {
                  wrapped.put("result", result);
                  reply.reply(wrapped);
                }
                public void error(Throwable error) {
                  wrapped.put("error", wrapError(error));
                  reply.reply(wrapped);
                }
              };

              api.closePlaybackSound(resultCallback);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
              reply.reply(wrapped);
            }
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.HikvisionSdk.setPlaybackVolume", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              ArrayList<Object> args = (ArrayList<Object>)message;
              Number volumePercentArg = (Number)args.get(0);
              if (volumePercentArg == null) {
                throw new NullPointerException("volumePercentArg unexpectedly null.");
              }
              Result<AccsResponse> resultCallback = new Result<AccsResponse>() {
                public void success(AccsResponse result) {
                  wrapped.put("result", result);
                  reply.reply(wrapped);
                }
                public void error(Throwable error) {
                  wrapped.put("error", wrapError(error));
                  reply.reply(wrapped);
                }
              };

              api.setPlaybackVolume((volumePercentArg == null) ? null : volumePercentArg.longValue(), resultCallback);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
              reply.reply(wrapped);
            }
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.HikvisionSdk.searchPlaybackFilesInRange", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              ArrayList<Object> args = (ArrayList<Object>)message;
              String fromTimeArg = (String)args.get(0);
              if (fromTimeArg == null) {
                throw new NullPointerException("fromTimeArg unexpectedly null.");
              }
              String toTimeArg = (String)args.get(1);
              if (toTimeArg == null) {
                throw new NullPointerException("toTimeArg unexpectedly null.");
              }
              Result<AccsResponse> resultCallback = new Result<AccsResponse>() {
                public void success(AccsResponse result) {
                  wrapped.put("result", result);
                  reply.reply(wrapped);
                }
                public void error(Throwable error) {
                  wrapped.put("error", wrapError(error));
                  reply.reply(wrapped);
                }
              };

              api.searchPlaybackFilesInRange(fromTimeArg, toTimeArg, resultCallback);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
              reply.reply(wrapped);
            }
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
    }
  }
  private static Map<String, Object> wrapError(Throwable exception) {
    Map<String, Object> errorMap = new HashMap<>();
    errorMap.put("message", exception.toString());
    errorMap.put("code", exception.getClass().getSimpleName());
    errorMap.put("details", "Cause: " + exception.getCause() + ", Stacktrace: " + Log.getStackTraceString(exception));
    return errorMap;
  }
}
