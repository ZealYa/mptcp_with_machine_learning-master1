################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/mpi/examples/nms-p2p-nix-distributed.cc \
../forbackup/src/mpi/examples/simple-distributed-empty-node.cc \
../forbackup/src/mpi/examples/simple-distributed.cc \
../forbackup/src/mpi/examples/third-distributed.cc 

CC_DEPS += \
./forbackup/src/mpi/examples/nms-p2p-nix-distributed.d \
./forbackup/src/mpi/examples/simple-distributed-empty-node.d \
./forbackup/src/mpi/examples/simple-distributed.d \
./forbackup/src/mpi/examples/third-distributed.d 

OBJS += \
./forbackup/src/mpi/examples/nms-p2p-nix-distributed.o \
./forbackup/src/mpi/examples/simple-distributed-empty-node.o \
./forbackup/src/mpi/examples/simple-distributed.o \
./forbackup/src/mpi/examples/third-distributed.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/mpi/examples/%.o: ../forbackup/src/mpi/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


