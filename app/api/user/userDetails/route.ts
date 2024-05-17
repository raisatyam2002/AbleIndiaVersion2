import { NEXT_AUTH_CONFIG } from "@/lib/auth";
import { getServerSession } from "next-auth";
import { NextRequest, NextResponse } from "next/server";
import { PrismaClient } from "@prisma/client";
import { log } from "console";
const prisma = new PrismaClient();
export async function getSession() {
  const session = await getServerSession(NEXT_AUTH_CONFIG);
  return session;
}

export async function GET() {
  const session = await getSession();
  console.log(session);
  return NextResponse.json({
    id: session.user.id,
  });
}
export async function POST(req: NextRequest) {
  const session = await getSession();
  const body = await req.json();
  console.log("session", session.user.id);

  const {
    name,
    phoneNumber,
    currentCity,
    collegeName,
    degree,
    cgpa,
    branch,
    startDate,
    endDate,
  } = body;
  try {
    await prisma.user.update({
      where: {
        id: parseInt(session.user.id),
      },
      data: {
        name: name,
        phoneNumber: phoneNumber,
        CurrentCity: currentCity,
        education: {
          upsert: {
            create: {
              collegeName: collegeName,
              degree: degree,
              cgpa: cgpa,
              branch: branch,
              startDate: startDate,
              endDate: endDate,
            },
            update: {
              collegeName: collegeName,
              degree: degree,
              cgpa: cgpa,
              branch: branch,
              startDate: startDate,
              endDate: endDate,
            },
            where: {
              userId: parseInt(session.user.id),
            },
          },
        },
      },
    });
    return NextResponse.json({
      message: "update user details",
    });
  } catch (error) {
    console.error(error);
    return NextResponse.json({
      message: "failed to update user details",
    });
  }
}
