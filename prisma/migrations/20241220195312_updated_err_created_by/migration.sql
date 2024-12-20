-- CreateTable
CREATE TABLE "user" (
    "id" UUID NOT NULL,
    "firstName" VARCHAR(255) NOT NULL,
    "lastName" VARCHAR(255) NOT NULL,
    "middleName" VARCHAR(255) NOT NULL,
    "email" TEXT,
    "phone" VARCHAR(15),
    "gender" VARCHAR(15),
    "username" VARCHAR(15) NOT NULL,
    "passwordHash" VARCHAR(255) NOT NULL,
    "profileImageUrl" VARCHAR(255),
    "status" VARCHAR(15),
    "socialProviderId" VARCHAR(255),
    "lastLogin" TIMESTAMP(3),
    "isNewUser" BOOLEAN NOT NULL DEFAULT true,
    "isPasswordChanged" BOOLEAN NOT NULL DEFAULT false,
    "dob" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "isActive" INTEGER NOT NULL DEFAULT 1,
    "userAddressId" UUID,

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "school" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "address" VARCHAR(255),
    "email" TEXT,
    "phone" VARCHAR(15),
    "latitude" DECIMAL(11,8),
    "longitude" DECIMAL(11,8),
    "organizationId" INTEGER NOT NULL,
    "websiteUrl" VARCHAR(255),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "isActive" INTEGER NOT NULL DEFAULT 1,
    "userId" UUID,

    CONSTRAINT "school_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "userAddress" (
    "id" UUID NOT NULL,
    "street" VARCHAR(255) NOT NULL,
    "city" VARCHAR(255) NOT NULL,
    "state" VARCHAR(255) NOT NULL,
    "locality" VARCHAR(255) NOT NULL,
    "lat" DECIMAL(11,8),
    "lng" DECIMAL(11,8),
    "country" VARCHAR(255) NOT NULL,
    "isActive" INTEGER NOT NULL DEFAULT 1,
    "userId" UUID NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "userAddress_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "accessToken" (
    "id" UUID NOT NULL,
    "userId" UUID NOT NULL,
    "accessToken" VARCHAR(255) NOT NULL,
    "deviceType" VARCHAR(50) NOT NULL,
    "ipAddress" VARCHAR(45) NOT NULL,
    "isValid" INTEGER NOT NULL DEFAULT 1,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "expiredAt" TIMESTAMP(3),

    CONSTRAINT "accessToken_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "userSession" (
    "id" UUID NOT NULL,
    "userId" UUID NOT NULL,
    "sessionToken" VARCHAR(255) NOT NULL,
    "idToken" VARCHAR(255) NOT NULL,
    "deviceType" VARCHAR(50) NOT NULL,
    "ipAddress" VARCHAR(45) NOT NULL,
    "isValid" INTEGER NOT NULL DEFAULT 1,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "expiredAt" TIMESTAMP(3),

    CONSTRAINT "userSession_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "userSchoolMembership" (
    "id" UUID NOT NULL,
    "userId" UUID NOT NULL,
    "schoolId" INTEGER NOT NULL,
    "isActive" INTEGER NOT NULL DEFAULT 1,
    "joinedAt" TIMESTAMP(3),
    "leftAt" TIMESTAMP(3),

    CONSTRAINT "userSchoolMembership_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_email_key" ON "user"("email");

-- CreateIndex
CREATE UNIQUE INDEX "school_email_key" ON "school"("email");

-- AddForeignKey
ALTER TABLE "school" ADD CONSTRAINT "school_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "school" ADD CONSTRAINT "school_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "userAddress" ADD CONSTRAINT "userAddress_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "accessToken" ADD CONSTRAINT "accessToken_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "userSession" ADD CONSTRAINT "userSession_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "userSchoolMembership" ADD CONSTRAINT "userSchoolMembership_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "userSchoolMembership" ADD CONSTRAINT "userSchoolMembership_schoolId_fkey" FOREIGN KEY ("schoolId") REFERENCES "school"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
