# Daemon Rooms (1.0)

Best mobile horror game ever...

## Getting Started

1. Clone the repository

2. Run "flutter packages get" in root folder

3. Unity
  3.1 Open unity project with version (2021.3.6f1 of Unity)
  3.2 Click File => build settings, and check that android is selected. Then check player settings (
    No vulcan in Graphics APIs but enabled OpenGLES2
    Scripting background IL2CPP
    Target architecures: ARMv7 + ARM64
  )
  3.3 Click "flutter" => Export Android

4. In android/grable.properties
```
  android.useAndroidX=true
  android.enableJetifier=true
  android.bundle.enableUncompressedNativeLibs=false
  org.gradle.jvmargs=-Xmx4608M
```

5. In android/local.properties add line to your ndk
```
  ndk.dir=C:\\Program Files\\Unity\\Hub\\Editor\\2021.3.6f1\\Editor\\Data\\PlaybackEngines\\AndroidPlayer\\NDK
```



