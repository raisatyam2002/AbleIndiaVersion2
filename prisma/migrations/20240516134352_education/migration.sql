-- AlterTable
ALTER TABLE "User" ADD COLUMN     "CurrentCity" TEXT,
ADD COLUMN     "phoneNumber" INTEGER,
ADD COLUMN     "userPoints" INTEGER;

-- CreateTable
CREATE TABLE "Education" (
    "id" SERIAL NOT NULL,
    "collegeName" TEXT NOT NULL,
    "degree" TEXT NOT NULL,
    "cgpa" INTEGER NOT NULL,
    "branch" TEXT NOT NULL,
    "startDate" TEXT NOT NULL,
    "endDate" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "Education_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Education_userId_key" ON "Education"("userId");

-- AddForeignKey
ALTER TABLE "Education" ADD CONSTRAINT "Education_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
