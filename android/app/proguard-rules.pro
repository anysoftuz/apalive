# Fresco (Facebook Image Pipeline) uchun kerakli classlar
-keep class com.facebook.imagepipeline.** { *; }
-keep class com.facebook.soloader.** { *; }
-keep class com.facebook.common.** { *; }
-keep class com.facebook.drawee.** { *; }
-keep class com.facebook.cache.** { *; }
-keep class com.facebook.binaryresource.** { *; }
-keep class com.facebook.imagepipeline.nativecode.** { *; }
-keep class com.facebook.imagepipeline.backends.** { *; }
-keep class com.facebook.imagepipeline.transcoder.** { *; }
-keep class com.facebook.imageformat.** { *; }

# Native metodlar uchun
-keepclassmembers class * {
    native <methods>;
}

# Fresco Annotatsiyalari (agar ishlatilgan bo‘lsa)
-keep,allowobfuscation @interface com.facebook.proguard.annotations.DoNotStrip
-keep @com.facebook.proguard.annotations.DoNotStrip class *
-keepclassmembers class * {
    @com.facebook.proguard.annotations.DoNotStrip *;
}
-keep @com.facebook.proguard.annotations.DoNotStripAny class * {
    *;
}
-keepclassmembers @com.facebook.proguard.annotations.KeepGettersAndSetters class * {
  void set*(***);
  *** get*();
}

# WebRTC qo‘llab-quvvatlash
-keep class org.webrtc.** { *; }
-dontwarn org.chromium.build.BuildHooksAndroid

# Jitsi Meet SDK uchun qo‘llab-quvvatlash
-keep class org.jitsi.meet.** { *; }
-keep class org.jitsi.meet.sdk.** { *; }

# Flutter SVG plugin (flutter_svg) uchun kerakli qoida
-keep public class com.horcrux.svg.** { *; }

# Fresco build error xatolari uchun (aniq muammoli klasslar)
-keep public class com.facebook.imageutils.** {
   public *;
}

# Dasturda yo‘q klasslar haqida ogohlantirmaslik (ixtiyoriy, muammoni to‘sib turadi)
-dontwarn com.facebook.**
