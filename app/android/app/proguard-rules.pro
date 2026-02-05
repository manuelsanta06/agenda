# Reglas para OkHttp y sus dependencias opcionales
-dontwarn okhttp3.**
-dontwarn okio.**
-dontwarn org.bouncycastle.**
-dontwarn org.conscrypt.**
-dontwarn org.openjsse.**

# Reglas para uCrop (por si acaso)
-dontwarn com.yalantis.ucrop**
-keep class com.yalantis.ucrop** { *; }
