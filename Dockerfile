# Use the latest Ubuntu as a base
FROM ubuntu:latest

# Set the environment variables
ENV FLUTTER_VERSION=3.3.10
ENV DART_VERSION=2.18.6
ENV ANDROID_SDK_VERSION=33.0.1
ENV ANDROID_HOME=/usr/lib/android-sdk

# Install required tools and dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    xz-utils \
    zip \
    libglu1-mesa \
    openjdk-11-jdk

# Download and install Flutter
RUN git clone https://github.com/flutter/flutter.git -b stable /flutter
ENV PATH="/flutter/bin:/flutter/bin/cache/dart-sdk/bin:${PATH}"
RUN flutter doctor
RUN flutter precache

# Set Flutter and Dart to the specific versions
RUN flutter version $FLUTTER_VERSION
RUN flutter downgrade dart $DART_VERSION

# Download and install Android SDK
RUN mkdir -p ${ANDROID_HOME} && cd ${ANDROID_HOME} \
    && curl -o sdk-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip \
    && unzip sdk-tools.zip && rm sdk-tools.zip

# Set environment variables for Android SDK
ENV PATH="${ANDROID_HOME}/cmdline-tools/bin:${PATH}"

# Accept licenses before installing components
RUN yes | sdkmanager --licenses

# Install specific Android SDK version and tools
RUN sdkmanager "platform-tools" "platforms;android-${ANDROID_SDK_VERSION}" "build-tools;${ANDROID_SDK_VERSION}"

# Download and install Android Studio
RUN curl -o android-studio.tar.gz https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2022.1.0.16/android-studio-2022.1.0.16-linux.tar.gz \
    && tar -xzf android-studio.tar.gz -C /usr/local \
    && rm android-studio.tar.gz

# Set Android Studio in the path
ENV PATH="/usr/local/android-studio/bin:${PATH}"

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /project

# Expose any ports needed by your app (if any)
# EXPOSE <PORT_NUMBER>

# The command to run your application (if any)
# CMD ["your-command-here"]
