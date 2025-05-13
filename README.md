# upv_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

1.create key :-------
keytool -genkey -v -keystore D:\webs\upvkey.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
123abc
123abc
RanjanDutta
What is the name of your organizational unit?
it
What is the name of your organization?
IT
What is the name of your City or Locality?
Asansol
What is the name of your State or Province?
Westbengal
What is the two-letter country code for this unit?
71
Is CN=RanjanDutta, OU=it, O=IT, L=Asansol, ST=Westbengal, C=71 correct?
yes

2.update android/app/build.gradle file:-------
def keystoreProperties = new Properties()
def keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
}

    signingConfigs {

        release {
                keyAlias keystoreProperties['keyAlias']
                keyPassword keystoreProperties['keyPassword']
                storeFile file(keystoreProperties['storeFile'])
                storePassword keystoreProperties['storePassword']
            }
    }
    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now,
            // so `flutter run --release` works.
            // signingConfig = signingConfigs.getByName("debug")
            signingConfig = signingConfigs.release
        }
    }

3.key.properties:----
create a key.properties file inside android and also move the kye.jks file there and save this text into key.properties file
storePassword=123abc
keyPassword=123abc
keyAlias=key
storeFile=../key.jks
