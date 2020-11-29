################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/core/model/attribute-construction-list.cc \
../forbackup/src/core/model/attribute.cc \
../forbackup/src/core/model/boolean.cc \
../forbackup/src/core/model/breakpoint.cc \
../forbackup/src/core/model/calendar-scheduler.cc \
../forbackup/src/core/model/callback.cc \
../forbackup/src/core/model/command-line.cc \
../forbackup/src/core/model/config.cc \
../forbackup/src/core/model/default-simulator-impl.cc \
../forbackup/src/core/model/double.cc \
../forbackup/src/core/model/enum.cc \
../forbackup/src/core/model/event-id.cc \
../forbackup/src/core/model/event-impl.cc \
../forbackup/src/core/model/fatal-impl.cc \
../forbackup/src/core/model/global-value.cc \
../forbackup/src/core/model/hash-fnv.cc \
../forbackup/src/core/model/hash-function.cc \
../forbackup/src/core/model/hash-murmur3.cc \
../forbackup/src/core/model/hash.cc \
../forbackup/src/core/model/heap-scheduler.cc \
../forbackup/src/core/model/int64x64-128.cc \
../forbackup/src/core/model/int64x64-cairo.cc \
../forbackup/src/core/model/int64x64.cc \
../forbackup/src/core/model/integer.cc \
../forbackup/src/core/model/list-scheduler.cc \
../forbackup/src/core/model/log.cc \
../forbackup/src/core/model/make-event.cc \
../forbackup/src/core/model/map-scheduler.cc \
../forbackup/src/core/model/names.cc \
../forbackup/src/core/model/object-base.cc \
../forbackup/src/core/model/object-factory.cc \
../forbackup/src/core/model/object-ptr-container.cc \
../forbackup/src/core/model/object.cc \
../forbackup/src/core/model/pointer.cc \
../forbackup/src/core/model/random-variable-stream.cc \
../forbackup/src/core/model/realtime-simulator-impl.cc \
../forbackup/src/core/model/ref-count-base.cc \
../forbackup/src/core/model/rng-seed-manager.cc \
../forbackup/src/core/model/rng-stream.cc \
../forbackup/src/core/model/scheduler.cc \
../forbackup/src/core/model/simulator-impl.cc \
../forbackup/src/core/model/simulator.cc \
../forbackup/src/core/model/string.cc \
../forbackup/src/core/model/synchronizer.cc \
../forbackup/src/core/model/system-path.cc \
../forbackup/src/core/model/system-thread.cc \
../forbackup/src/core/model/test.cc \
../forbackup/src/core/model/time.cc \
../forbackup/src/core/model/timer.cc \
../forbackup/src/core/model/trace-source-accessor.cc \
../forbackup/src/core/model/type-id.cc \
../forbackup/src/core/model/type-name.cc \
../forbackup/src/core/model/uinteger.cc \
../forbackup/src/core/model/unix-fd-reader.cc \
../forbackup/src/core/model/unix-system-condition.cc \
../forbackup/src/core/model/unix-system-mutex.cc \
../forbackup/src/core/model/unix-system-wall-clock-ms.cc \
../forbackup/src/core/model/vector.cc \
../forbackup/src/core/model/wall-clock-synchronizer.cc \
../forbackup/src/core/model/watchdog.cc \
../forbackup/src/core/model/win32-system-wall-clock-ms.cc 

C_SRCS += \
../forbackup/src/core/model/cairo-wideint.c 

CC_DEPS += \
./forbackup/src/core/model/attribute-construction-list.d \
./forbackup/src/core/model/attribute.d \
./forbackup/src/core/model/boolean.d \
./forbackup/src/core/model/breakpoint.d \
./forbackup/src/core/model/calendar-scheduler.d \
./forbackup/src/core/model/callback.d \
./forbackup/src/core/model/command-line.d \
./forbackup/src/core/model/config.d \
./forbackup/src/core/model/default-simulator-impl.d \
./forbackup/src/core/model/double.d \
./forbackup/src/core/model/enum.d \
./forbackup/src/core/model/event-id.d \
./forbackup/src/core/model/event-impl.d \
./forbackup/src/core/model/fatal-impl.d \
./forbackup/src/core/model/global-value.d \
./forbackup/src/core/model/hash-fnv.d \
./forbackup/src/core/model/hash-function.d \
./forbackup/src/core/model/hash-murmur3.d \
./forbackup/src/core/model/hash.d \
./forbackup/src/core/model/heap-scheduler.d \
./forbackup/src/core/model/int64x64-128.d \
./forbackup/src/core/model/int64x64-cairo.d \
./forbackup/src/core/model/int64x64.d \
./forbackup/src/core/model/integer.d \
./forbackup/src/core/model/list-scheduler.d \
./forbackup/src/core/model/log.d \
./forbackup/src/core/model/make-event.d \
./forbackup/src/core/model/map-scheduler.d \
./forbackup/src/core/model/names.d \
./forbackup/src/core/model/object-base.d \
./forbackup/src/core/model/object-factory.d \
./forbackup/src/core/model/object-ptr-container.d \
./forbackup/src/core/model/object.d \
./forbackup/src/core/model/pointer.d \
./forbackup/src/core/model/random-variable-stream.d \
./forbackup/src/core/model/realtime-simulator-impl.d \
./forbackup/src/core/model/ref-count-base.d \
./forbackup/src/core/model/rng-seed-manager.d \
./forbackup/src/core/model/rng-stream.d \
./forbackup/src/core/model/scheduler.d \
./forbackup/src/core/model/simulator-impl.d \
./forbackup/src/core/model/simulator.d \
./forbackup/src/core/model/string.d \
./forbackup/src/core/model/synchronizer.d \
./forbackup/src/core/model/system-path.d \
./forbackup/src/core/model/system-thread.d \
./forbackup/src/core/model/test.d \
./forbackup/src/core/model/time.d \
./forbackup/src/core/model/timer.d \
./forbackup/src/core/model/trace-source-accessor.d \
./forbackup/src/core/model/type-id.d \
./forbackup/src/core/model/type-name.d \
./forbackup/src/core/model/uinteger.d \
./forbackup/src/core/model/unix-fd-reader.d \
./forbackup/src/core/model/unix-system-condition.d \
./forbackup/src/core/model/unix-system-mutex.d \
./forbackup/src/core/model/unix-system-wall-clock-ms.d \
./forbackup/src/core/model/vector.d \
./forbackup/src/core/model/wall-clock-synchronizer.d \
./forbackup/src/core/model/watchdog.d \
./forbackup/src/core/model/win32-system-wall-clock-ms.d 

OBJS += \
./forbackup/src/core/model/attribute-construction-list.o \
./forbackup/src/core/model/attribute.o \
./forbackup/src/core/model/boolean.o \
./forbackup/src/core/model/breakpoint.o \
./forbackup/src/core/model/cairo-wideint.o \
./forbackup/src/core/model/calendar-scheduler.o \
./forbackup/src/core/model/callback.o \
./forbackup/src/core/model/command-line.o \
./forbackup/src/core/model/config.o \
./forbackup/src/core/model/default-simulator-impl.o \
./forbackup/src/core/model/double.o \
./forbackup/src/core/model/enum.o \
./forbackup/src/core/model/event-id.o \
./forbackup/src/core/model/event-impl.o \
./forbackup/src/core/model/fatal-impl.o \
./forbackup/src/core/model/global-value.o \
./forbackup/src/core/model/hash-fnv.o \
./forbackup/src/core/model/hash-function.o \
./forbackup/src/core/model/hash-murmur3.o \
./forbackup/src/core/model/hash.o \
./forbackup/src/core/model/heap-scheduler.o \
./forbackup/src/core/model/int64x64-128.o \
./forbackup/src/core/model/int64x64-cairo.o \
./forbackup/src/core/model/int64x64.o \
./forbackup/src/core/model/integer.o \
./forbackup/src/core/model/list-scheduler.o \
./forbackup/src/core/model/log.o \
./forbackup/src/core/model/make-event.o \
./forbackup/src/core/model/map-scheduler.o \
./forbackup/src/core/model/names.o \
./forbackup/src/core/model/object-base.o \
./forbackup/src/core/model/object-factory.o \
./forbackup/src/core/model/object-ptr-container.o \
./forbackup/src/core/model/object.o \
./forbackup/src/core/model/pointer.o \
./forbackup/src/core/model/random-variable-stream.o \
./forbackup/src/core/model/realtime-simulator-impl.o \
./forbackup/src/core/model/ref-count-base.o \
./forbackup/src/core/model/rng-seed-manager.o \
./forbackup/src/core/model/rng-stream.o \
./forbackup/src/core/model/scheduler.o \
./forbackup/src/core/model/simulator-impl.o \
./forbackup/src/core/model/simulator.o \
./forbackup/src/core/model/string.o \
./forbackup/src/core/model/synchronizer.o \
./forbackup/src/core/model/system-path.o \
./forbackup/src/core/model/system-thread.o \
./forbackup/src/core/model/test.o \
./forbackup/src/core/model/time.o \
./forbackup/src/core/model/timer.o \
./forbackup/src/core/model/trace-source-accessor.o \
./forbackup/src/core/model/type-id.o \
./forbackup/src/core/model/type-name.o \
./forbackup/src/core/model/uinteger.o \
./forbackup/src/core/model/unix-fd-reader.o \
./forbackup/src/core/model/unix-system-condition.o \
./forbackup/src/core/model/unix-system-mutex.o \
./forbackup/src/core/model/unix-system-wall-clock-ms.o \
./forbackup/src/core/model/vector.o \
./forbackup/src/core/model/wall-clock-synchronizer.o \
./forbackup/src/core/model/watchdog.o \
./forbackup/src/core/model/win32-system-wall-clock-ms.o 

C_DEPS += \
./forbackup/src/core/model/cairo-wideint.d 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/core/model/%.o: ../forbackup/src/core/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

forbackup/src/core/model/%.o: ../forbackup/src/core/model/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross GCC Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


