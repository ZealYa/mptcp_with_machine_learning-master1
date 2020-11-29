################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/dsr/model/dsr-errorbuff.cc \
../forbackup/src/dsr/model/dsr-fs-header.cc \
../forbackup/src/dsr/model/dsr-gratuitous-reply-table.cc \
../forbackup/src/dsr/model/dsr-maintain-buff.cc \
../forbackup/src/dsr/model/dsr-network-queue.cc \
../forbackup/src/dsr/model/dsr-option-header.cc \
../forbackup/src/dsr/model/dsr-options.cc \
../forbackup/src/dsr/model/dsr-passive-buff.cc \
../forbackup/src/dsr/model/dsr-rcache.cc \
../forbackup/src/dsr/model/dsr-routing.cc \
../forbackup/src/dsr/model/dsr-rreq-table.cc \
../forbackup/src/dsr/model/dsr-rsendbuff.cc 

CC_DEPS += \
./forbackup/src/dsr/model/dsr-errorbuff.d \
./forbackup/src/dsr/model/dsr-fs-header.d \
./forbackup/src/dsr/model/dsr-gratuitous-reply-table.d \
./forbackup/src/dsr/model/dsr-maintain-buff.d \
./forbackup/src/dsr/model/dsr-network-queue.d \
./forbackup/src/dsr/model/dsr-option-header.d \
./forbackup/src/dsr/model/dsr-options.d \
./forbackup/src/dsr/model/dsr-passive-buff.d \
./forbackup/src/dsr/model/dsr-rcache.d \
./forbackup/src/dsr/model/dsr-routing.d \
./forbackup/src/dsr/model/dsr-rreq-table.d \
./forbackup/src/dsr/model/dsr-rsendbuff.d 

OBJS += \
./forbackup/src/dsr/model/dsr-errorbuff.o \
./forbackup/src/dsr/model/dsr-fs-header.o \
./forbackup/src/dsr/model/dsr-gratuitous-reply-table.o \
./forbackup/src/dsr/model/dsr-maintain-buff.o \
./forbackup/src/dsr/model/dsr-network-queue.o \
./forbackup/src/dsr/model/dsr-option-header.o \
./forbackup/src/dsr/model/dsr-options.o \
./forbackup/src/dsr/model/dsr-passive-buff.o \
./forbackup/src/dsr/model/dsr-rcache.o \
./forbackup/src/dsr/model/dsr-routing.o \
./forbackup/src/dsr/model/dsr-rreq-table.o \
./forbackup/src/dsr/model/dsr-rsendbuff.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/dsr/model/%.o: ../forbackup/src/dsr/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


