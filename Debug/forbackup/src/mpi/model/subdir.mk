################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/mpi/model/distributed-simulator-impl.cc \
../forbackup/src/mpi/model/granted-time-window-mpi-interface.cc \
../forbackup/src/mpi/model/mpi-interface.cc \
../forbackup/src/mpi/model/mpi-receiver.cc \
../forbackup/src/mpi/model/null-message-mpi-interface.cc \
../forbackup/src/mpi/model/null-message-simulator-impl.cc \
../forbackup/src/mpi/model/remote-channel-bundle-manager.cc \
../forbackup/src/mpi/model/remote-channel-bundle.cc 

CC_DEPS += \
./forbackup/src/mpi/model/distributed-simulator-impl.d \
./forbackup/src/mpi/model/granted-time-window-mpi-interface.d \
./forbackup/src/mpi/model/mpi-interface.d \
./forbackup/src/mpi/model/mpi-receiver.d \
./forbackup/src/mpi/model/null-message-mpi-interface.d \
./forbackup/src/mpi/model/null-message-simulator-impl.d \
./forbackup/src/mpi/model/remote-channel-bundle-manager.d \
./forbackup/src/mpi/model/remote-channel-bundle.d 

OBJS += \
./forbackup/src/mpi/model/distributed-simulator-impl.o \
./forbackup/src/mpi/model/granted-time-window-mpi-interface.o \
./forbackup/src/mpi/model/mpi-interface.o \
./forbackup/src/mpi/model/mpi-receiver.o \
./forbackup/src/mpi/model/null-message-mpi-interface.o \
./forbackup/src/mpi/model/null-message-simulator-impl.o \
./forbackup/src/mpi/model/remote-channel-bundle-manager.o \
./forbackup/src/mpi/model/remote-channel-bundle.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/mpi/model/%.o: ../forbackup/src/mpi/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


