################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/core/test/attribute-test-suite.cc \
../forbackup/src/core/test/build-profile-test-suite.cc \
../forbackup/src/core/test/callback-test-suite.cc \
../forbackup/src/core/test/command-line-test-suite.cc \
../forbackup/src/core/test/config-test-suite.cc \
../forbackup/src/core/test/event-garbage-collector-test-suite.cc \
../forbackup/src/core/test/global-value-test-suite.cc \
../forbackup/src/core/test/hash-test-suite.cc \
../forbackup/src/core/test/int64x64-test-suite.cc \
../forbackup/src/core/test/many-uniform-random-variables-one-get-value-call-test-suite.cc \
../forbackup/src/core/test/names-test-suite.cc \
../forbackup/src/core/test/object-test-suite.cc \
../forbackup/src/core/test/one-uniform-random-variable-many-get-value-calls-test-suite.cc \
../forbackup/src/core/test/ptr-test-suite.cc \
../forbackup/src/core/test/random-variable-stream-test-suite.cc \
../forbackup/src/core/test/rng-test-suite.cc \
../forbackup/src/core/test/sample-test-suite.cc \
../forbackup/src/core/test/simulator-test-suite.cc \
../forbackup/src/core/test/threaded-test-suite.cc \
../forbackup/src/core/test/time-test-suite.cc \
../forbackup/src/core/test/timer-test-suite.cc \
../forbackup/src/core/test/traced-callback-test-suite.cc \
../forbackup/src/core/test/type-id-test-suite.cc \
../forbackup/src/core/test/type-traits-test-suite.cc \
../forbackup/src/core/test/watchdog-test-suite.cc 

CC_DEPS += \
./forbackup/src/core/test/attribute-test-suite.d \
./forbackup/src/core/test/build-profile-test-suite.d \
./forbackup/src/core/test/callback-test-suite.d \
./forbackup/src/core/test/command-line-test-suite.d \
./forbackup/src/core/test/config-test-suite.d \
./forbackup/src/core/test/event-garbage-collector-test-suite.d \
./forbackup/src/core/test/global-value-test-suite.d \
./forbackup/src/core/test/hash-test-suite.d \
./forbackup/src/core/test/int64x64-test-suite.d \
./forbackup/src/core/test/many-uniform-random-variables-one-get-value-call-test-suite.d \
./forbackup/src/core/test/names-test-suite.d \
./forbackup/src/core/test/object-test-suite.d \
./forbackup/src/core/test/one-uniform-random-variable-many-get-value-calls-test-suite.d \
./forbackup/src/core/test/ptr-test-suite.d \
./forbackup/src/core/test/random-variable-stream-test-suite.d \
./forbackup/src/core/test/rng-test-suite.d \
./forbackup/src/core/test/sample-test-suite.d \
./forbackup/src/core/test/simulator-test-suite.d \
./forbackup/src/core/test/threaded-test-suite.d \
./forbackup/src/core/test/time-test-suite.d \
./forbackup/src/core/test/timer-test-suite.d \
./forbackup/src/core/test/traced-callback-test-suite.d \
./forbackup/src/core/test/type-id-test-suite.d \
./forbackup/src/core/test/type-traits-test-suite.d \
./forbackup/src/core/test/watchdog-test-suite.d 

OBJS += \
./forbackup/src/core/test/attribute-test-suite.o \
./forbackup/src/core/test/build-profile-test-suite.o \
./forbackup/src/core/test/callback-test-suite.o \
./forbackup/src/core/test/command-line-test-suite.o \
./forbackup/src/core/test/config-test-suite.o \
./forbackup/src/core/test/event-garbage-collector-test-suite.o \
./forbackup/src/core/test/global-value-test-suite.o \
./forbackup/src/core/test/hash-test-suite.o \
./forbackup/src/core/test/int64x64-test-suite.o \
./forbackup/src/core/test/many-uniform-random-variables-one-get-value-call-test-suite.o \
./forbackup/src/core/test/names-test-suite.o \
./forbackup/src/core/test/object-test-suite.o \
./forbackup/src/core/test/one-uniform-random-variable-many-get-value-calls-test-suite.o \
./forbackup/src/core/test/ptr-test-suite.o \
./forbackup/src/core/test/random-variable-stream-test-suite.o \
./forbackup/src/core/test/rng-test-suite.o \
./forbackup/src/core/test/sample-test-suite.o \
./forbackup/src/core/test/simulator-test-suite.o \
./forbackup/src/core/test/threaded-test-suite.o \
./forbackup/src/core/test/time-test-suite.o \
./forbackup/src/core/test/timer-test-suite.o \
./forbackup/src/core/test/traced-callback-test-suite.o \
./forbackup/src/core/test/type-id-test-suite.o \
./forbackup/src/core/test/type-traits-test-suite.o \
./forbackup/src/core/test/watchdog-test-suite.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/core/test/%.o: ../forbackup/src/core/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


